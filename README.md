# shelby-storage

Privacy-first storage toolkit for Shelby (shelbynet): docs, naming conventions, status checks, and troubleshooting.

## What this repo is
- A safe place for documentation and lightweight tooling around Shelby storage (blobs).
- Standards for unique blob naming and reproducible upload/debug steps.

## What this repo is NOT
This repo must NOT contain:
- private keys, seed phrases, passwords, API tokens
- `~/.shelby/config.yaml` or any local Shelby config
- server IP addresses or sensitive logs

## Quick commands (run where Shelby CLI is installed)
- Balance:
  `shelby --context=shelbynet --account=default_account account balance`

- List blobs:
  `shelby --context=shelbynet --account=default_account account blobs`

## Repository structure
- `docs/` – guides and troubleshooting
- `tools/` – helper notes/tools (no secrets)
- `manifests/` – metadata templates (hash/size/status)
