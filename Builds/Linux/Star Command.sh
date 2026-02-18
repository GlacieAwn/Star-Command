#!/bin/sh
printf '\033c\033]0;%s\a' Star Command
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Star Command.x86_64" "$@"
