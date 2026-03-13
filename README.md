## Features
- Privacy-first (no secrets in repo)
- Simple scripts for balance/blobs/status
- Unique blob naming to avoid collisions
- Troubleshooting guide for Pending/Written issues

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

## Requirements

You need the Shelby CLI installed and configured on the machine where you run these scripts.

- Shelby CLI must be available as: `shelby`
- Your local config (NOT committed to this repo) should exist at:
  - `~/.shelby/config.yaml`

This repo does not include any credentials.

## Configuration (what you might need to change)

The scripts use environment variables so you usually do NOT need to edit code.

Defaults:
- `CTX=shelbynet`
- `ACCOUNT=default_account`
- `EXPIRES=tomorrow` (for uploads)

Override them like this:

```bash
CTX=shelbynet ACCOUNT=default_account EXPIRES=tomorrow ./scripts/balance.sh
```
If your account alias is different

Change only the environment variable:

ACCOUNT=my_account ./scripts/balance.sh

If your context name is different

CTX=my_context ./scripts/blobs.sh

Quick start (recommended order)

1. Check balance:

./scripts/balance.sh

2. List blobs:

./scripts/blobs.sh

3. Get a simple Pending/Written summary:

./scripts/status_summary.sh

4. Upload a file with a unique blob name:

./scripts/upload_unique.sh ./examples/sample.txt files/storage/text txt

What each script does

• scripts/balance.sh
  • Prints APT + ShelbyUSD balance for the configured account.
• scripts/blobs.sh
  • Lists blobs for the configured account.
• scripts/status_summary.sh
  • Prints total blobs + counts of Written/Pending based on CLI output.
• scripts/upload_unique.sh
  • Uploads a file using a collision-safe name:
    • YYYYMMDD-HHMMSS-NANOSECONDS-RAND.ext
  • This helps avoid already exists errors.

Safety / Privacy

Do NOT commit:

• private keys / seed phrases / passwords
• ~/.shelby/config.yaml
• server IP addresses or sensitive logs

If you need to share debug output publicly, redact sensitive information.

Troubleshooting

If uploads are stuck in Pending, see:

• docs/50-troubleshooting.md

Common error symptom:

• Failed to complete multipart upload! status: 500, body: Internal Server Error
