
module Main where

import Protolude

import Control.Lens
import Data.Text

data Person =
  Person
  { _name :: Text
  , _age  :: Int
  }

jojo = Person { _name = "Jojo", _age = 28 }

main = do
  putText "Hello "
  putText $ jojo ^. name

-- TemplateHaskell Lenses
makeClassy ''Person
