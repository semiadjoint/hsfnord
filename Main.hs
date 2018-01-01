{-# language TemplateHaskell #-}

module Main where

import Protolude
import Control.Lens

data Person =
  Person
  { _name :: Text
  , _age  :: Int
  }
-- Use TemplateHaskell to make lenses.
makeClassy ''Person

jojo :: Person
jojo = Person { _name = "Jojo", _age = 28 }

main = do
  putText "Hello "
  putText $ jojo ^. name

