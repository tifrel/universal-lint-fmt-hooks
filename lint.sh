#!/usr/bin/env bash

function cargo_lint {
  (
    cd "$1" || exit 1
    cargo check || exit 1
    cargo clippy || exit 1
  )
  if [[ "$?" != 0 ]]; then
    echo "Bad linting for $f" >&2
    exit 1
  fi
}

function lint {
  case "$1" in
  *.sh) shellcheck "$1" ;;
  *.js) eslint "$1" ;;
  *) return 0 ;;
  esac

  echo "Linted $1 with exit status: $?"

  if [[ "$?" != 0 ]]; then
    echo "Bad linting for $f" >&2
    exit 1
  fi
}

for f in $(git ls-files); do
  lint "$f"
done

cargo_lint dirty-rust
