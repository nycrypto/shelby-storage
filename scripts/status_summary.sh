#!/usr/bin/env bash
set -euo pipefail

CTX="${CTX:-shelbynet}"
ACCOUNT="${ACCOUNT:-default_account}"

OUT="$(shelby --context="$CTX" --account="$ACCOUNT" account blobs 2>&1 || true)"

TOTAL="$(echo "$OUT" | sed -nE 's/.*Retrieved ([0-9]+) blobs.*/\1/p' | tail -n 1)"
PENDING="$(echo "$OUT" | grep -c 'Pending' || true)"
WRITTEN="$(echo "$OUT" | grep -c 'Written' || true)"

echo "Context: $CTX"
echo "Account: $ACCOUNT"
echo "Total blobs: ${TOTAL:-N/A}"
echo "Written: $WRITTEN"
echo "Pending: $PENDING"
