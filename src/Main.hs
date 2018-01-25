module Main where

import Protolude
import Control.Lens
import Lib

main :: IO ()
main = do
  let pn = person0 ^. name
  putText $ "Hello " <> pn
