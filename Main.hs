{-# options_ghc -W -Werror #-}
{-# language TemplateHaskell #-}
{-# language NoImplicitPrelude #-}
{-# language DeriveFunctor #-}

module Main where

import Protolude hiding(Print,readFile,lift)
import Control.Lens

data Free f a =
  Done a
  | More (f (Free f a))

data Coproduct f g a =
  This (f a)
  | That (g a)

instance (Functor f, Functor g) => Functor (Coproduct f g) where
  fmap f (This x) =
    This (fmap f x)
  fmap f (That x) =
    That (fmap f x)

data ReadFile a =
  ReadFile Text (Text -> a)
  deriving Functor

lift ::
  Functor f =>
  f a
  -> Free f a
lift =
  More . fmap Done

readFile t k =
  lift (ReadFile t k)

data Print a =
  Print Text (() -> a)
  deriving Functor


data ReadFilePrint a =
  ReadFilePrint (Coproduct ReadFile Print a)
  deriving Functor

program1 ::
  (Functor f, AsReadFile f, AsPrint f) =>
  Free f ()
program1 = do
  f <- readFile "/x/.bashrc"
  print f

class AsIO f where
  asIO ::
    f a
    -> IO a

class AsPrint f where
  _Print ::
    Prism' (f a) (Print a)

class AsReadFile f where
  _ReadFile ::
    Prism' (f a) (ReadFile a)


foldFree ::
  AsIO f =>
  Free f a
  -> IO a
foldFree (Done a) =
  pure a
foldFree (More x) =
  asIO x >>= foldFree

runProgram =
  foldFree (program1 :: Free ReadFilePrint ())

main :: IO ()
main = do
  putText "Starting"
  runProgram
  putText "Finished"
