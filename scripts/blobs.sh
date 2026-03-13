#!/usr/bin/env bash
set -euo pipefail

CTX="${CTX:-shelbynet}"
ACCOUNT="${ACCOUNT:-default_account}"

shelby --context="$CTX" --account="$ACCOUNT" account blobs
