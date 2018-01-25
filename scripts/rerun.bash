#! /usr/env bash

main() {
  bash ./scripts/rebuild.bash && \
    bash ./scripts/run.bash $1
}

main "$@"
