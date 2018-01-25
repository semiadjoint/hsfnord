module Main where

import System.IO( BufferMode(..)
                , hSetBuffering
                , stdout
                , stderr
                )
import STLC

main ::
  IO ()
main = do
  hSetBuffering stdout LineBuffering
  hSetBuffering stderr LineBuffering

  _results <- sequence [
    STLC.tests
    ]

  pure ()
