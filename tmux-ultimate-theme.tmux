#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux run-shell "$CURRENT_DIR/scripts/theme.sh"
