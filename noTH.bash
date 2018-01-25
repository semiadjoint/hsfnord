#! /usr/bin/env bash

ag -g hs$ | \
  xargs sed -i.bak 's/ TemplateHaskell/ NoTemplateHaskell/g'
