# Troubleshooting

## 1) Uploads stuck in Pending
Symptoms:
- `account blobs` shows many `Pending` and `Written: 0`
- upload output shows `TX: N/A` or no explorer link

Common cause:
- Shelby RPC fails during multipart finalize/commit (often returns HTTP 500).
- Blob entry may still appear as Pending even if finalize failed.

What to collect:
- Shelby CLI version
- Context endpoints from `~/.shelby/config.yaml` (do NOT commit it; paste only endpoints)
- One verbose upload output (redact sensitive info)
- `shelby account blobs` summary (counts only)

Suggested report template:
- Network: shelbynet
- CLI version:
- Error:
  "Failed to complete multipart upload! status: 500, body: Internal Server Error"
- Written/Pending counts:
- Example blob name:
