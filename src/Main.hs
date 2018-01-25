{-# options_ghc -Wwarn #-}

module Main where

import Protolude
import Control.Lens
import Lib
import Config
import System.Log.FastLogger

main ::
  IO ()
main = do
  cfg <- loadConfigOrDie =<< parseCliConfigFile
  withFastLogger (LogStdout 1) (start cfg)

start ::
  Cfg
  -> FastLogger
  -> IO ()
start cfg log = do
  let pn = cfg ^. personCfg . pCfgName
  putText $ "Hello " <> pn
