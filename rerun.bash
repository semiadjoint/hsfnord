#! /usr/env bash

main() {
  bash rebuild.bash && \
    bash run.bash $1
}

main "$@"
