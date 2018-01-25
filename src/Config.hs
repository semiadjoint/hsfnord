{-# options_ghc -Wwarn #-}
{-# language TemplateHaskell #-}

module Config where

import Protolude
import Control.Lens
import Data.Ini.Config
import Options.Applicative
import qualified Data.Text as T

data PersonCfg =
  PersonCfg
  { _pCfgName :: Text
  , _pCfgAge  :: Text
  }
makeLenses '' PersonCfg

data Cfg =
  Cfg
  { _personCfg :: PersonCfg
  }
makeLenses '' Cfg

cfgParser :: IniParser Cfg
cfgParser =
  Cfg <$>
  (section "person" $
    PersonCfg <$> field "name" <*> field "age")

loadCfg ::
  Text
  -> IniParser Cfg
  -> IO (Either Text Cfg)
loadCfg filename parser =
  readFile (T.unpack filename) &
  fmap (\ c -> parseIniFile c parser &
         over _Left T.pack)

data CliCfg = CliCfg
  { _cfgFile :: Text
  }

cliConfig ::
  Parser CliCfg
cliConfig =
  CliCfg . T.pack <$> strOption (long "config-file" <> short 'f' <> help ".ini config file")

parseCli ::
  Parser CliCfg
  -> Text
  -> Text
  -> IO Text
parseCli cliCfg desc hdr =
  fmap _cfgFile (execParser opts)
  where
    opts = info (cliCfg <**> helper) (fullDesc <> progDesc (T.unpack desc) <> header (T.unpack hdr))

loadConfigOrDie ::
  Text
  -> IO Cfg
loadConfigOrDie cfgFile = do
  eCfg <- loadCfg cfgFile cfgParser
  eCfg & either
    (die . ("Loading config failed: " <>))
    pure

parseCliConfigFile ::
  IO Text
parseCliConfigFile =
  parseCli cliConfig desc hdr
  where
  desc = "an apt app description"
  hdr = "app name - app description"

myid ::
  forall a .
  a ->
  a
myid = identity
