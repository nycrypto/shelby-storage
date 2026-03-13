#!/usr/bin/env bash
set -euo pipefail

# Usage:
# ./scripts/upload_unique.sh <local_file> <prefix_dir> <ext>
# Example:
# ./scripts/upload_unique.sh ./examples/sample.txt files/storage/text txt

SRC="${1:-}"
PREFIX="${2:-}"
EXT="${3:-}"

if [[ -z "$SRC" || -z "$PREFIX" || -z "$EXT" ]]; then
echo "Usage: $0 <local_file> <prefix_dir> <ext>"
exit 1
fi

CTX="${CTX:-shelbynet}"
ACCOUNT="${ACCOUNT:-default_account}"
EXPIRES="${EXPIRES:-tomorrow}"

TS="$(TZ=Europe/Istanbul date +%Y%m%d-%H%M%S-%N)"
RAND="$(LC_ALL=C tr -dc 'a-f0-9' </dev/urandom | head -c 10 || true)"
NAME="${TS}-${RAND}.${EXT}"
DEST="${PREFIX%/}/${NAME}"

echo "Uploading:"
echo "- src: $SRC"
echo "- dest: $DEST"
echo "- ctx: $CTX"
echo "- acct: $ACCOUNT"
echo "- exp: $EXPIRES"
echo

shelby --context="$CTX" --account="$ACCOUNT" upload -e "$EXPIRES" --assume-yes "$SRC" "$DEST"
