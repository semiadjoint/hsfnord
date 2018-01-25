{-# options_ghc -Wwarn #-}
{-# language TemplateHaskell #-}

module Lib where

import Protolude
import Control.Lens

data Person =
  Person
  { _name :: Text
  , _age  :: Int
  }
makeClassy ''Person

person0 ::
  Person
person0 =
  Person
  { _name = "jojo"
  , _age = 28
  }
