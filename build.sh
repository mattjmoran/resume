#!/usr/bin/env bash
set -euo pipefail

[ $# -ne 1 ] && {
  echo "Usage: $(basename "$0") FILE.tex" >&2
  exit 1
}
[ ! -f "$1" ] && {
  echo "Error: File '$1' not found" >&2
  exit 1
}

docker build -t resume-latex .
docker run --rm -v "$(pwd):/vol" --user "$(id -u):$(id -g)" --env HOME=/tmp resume-latex "$1"
