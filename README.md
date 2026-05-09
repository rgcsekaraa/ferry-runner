# Ferry Runner

Personal GitHub Actions runner template for Ferry.

This repo is intentionally small. Ferry dispatches `.github/workflows/leech.yml`
with a magnet link or HTTP URL. The workflow downloads into the Actions runner
with `aria2c`, uploads the output to Google Drive with `rclone`, then reports
status back to the Ferry web app.

## Required Secrets

- `RCLONE_CONF`: full rclone config containing a `gdrive` remote.
- `WEBHOOK_SECRET`: shared HMAC secret also configured in the Ferry app.

## Manual Run

Open the `Leech to Drive` workflow and provide:

- `source_url`: magnet or HTTP/HTTPS URL.
- `job_id`: Ferry job ID, or any identifier for manual testing.
- `callback_url`: Ferry webhook endpoint, usually `https://your-app/api/hook`.
- `drive_folder`: destination folder, defaults to `Ferry`.

## Security

Do not paste secrets into workflow inputs. Use GitHub Actions repository secrets.
For public runner forks, workflow logs may expose source URLs and folder names.
