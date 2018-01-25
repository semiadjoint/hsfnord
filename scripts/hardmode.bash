#! /usr/bin/env bash

ag -g hs$ | xargs sed -i.bak s/Wwarn/Werror/g
