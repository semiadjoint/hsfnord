{-# options_ghc -Wwarn #-}

module Lib where

import Protolude
import Control.Lens

data Person =
  MkPerson
  { _name :: Text
  , _age  :: Int
  }

class HasPerson c_aiBd where
  person :: Lens' c_aiBd Person
  age :: Lens' c_aiBd Int
  {-# INLINE age #-}
  name :: Lens' c_aiBd Text
  {-# INLINE name #-}
  age = ((.) person) age
  name = ((.) person) name
instance HasPerson Person where
  {-# INLINE age #-}
  {-# INLINE name #-}
  person = identity
  age f_aiBe (MkPerson x1_aiBf x2_aiBg)
    = (fmap (\ y1_aiBh -> (MkPerson x1_aiBf) y1_aiBh)) (f_aiBe x2_aiBg)
  name f_aiBi (MkPerson x1_aiBj x2_aiBk)
    = (fmap (\ y1_aiBl -> (MkPerson y1_aiBl) x2_aiBk)) (f_aiBi x1_aiBj)

person0 ::
  Person
person0 =
  MkPerson
  { _name = "jojo"
  , _age = 28
  }
