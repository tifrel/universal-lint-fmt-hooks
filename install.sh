#!/usr/bin/env bash

# Formatting for shell scripts
sudo port install shfmt
# Linting for shell scripts
sudo port install shellcheck

# Formatting and Linting for TOML
cargo install taplo-cli

# Formatting for JS, JSON, MD, HTML, CSS, YAML (and probably more)
sudo port install prettier
# Linting for JS
npm i -g eslint
