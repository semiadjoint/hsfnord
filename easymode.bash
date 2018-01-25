#! /usr/bin/env bash

ag -g hs$ | xargs sed -i.bak s/Werror/Wwarn/g
