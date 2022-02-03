#!/usr/bin/env bash

function fmt {
	case "$1" in
	*.rs) rustfmt "$1" ;;
	*.sh) shfmt -w "$1" ;;
	*.toml) taplo format "$1" ;;
	*.js) prettier --write "$1" ;;
	*.json) prettier --write "$1" ;;
	*.yaml) prettier --write "$1" ;;
	*.md) prettier --write "$1" ;;
	*) return 0 ;;
	esac

	if [[ "$?" != 0 ]]; then
		echo "Could not format $1" >&2
		exit 1
	fi
}

for f in $(git ls-files); do
	fmt "$f"
done
