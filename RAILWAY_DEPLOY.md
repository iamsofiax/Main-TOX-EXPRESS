# Railway deploy — fixed settings

If deploy failed, use these **exact** Railway settings after the latest GitHub push.

## Service settings

| Setting | Value |
|---------|--------|
| **Root directory** | *(leave empty — repo root)* |
| **Build command** | `npm install` |
| **Start command** | `node server.js` |
| **Health check path** | `/health` |

Or: Railway should auto-read **`railway.json`** from the repo.

## Required variables (Settings → Variables)

Copy from your local `.env` file. Minimum:

- `ADMIN_PASSWORD`
- `EMAIL_USER`
- `EMAIL_PASSWORD`
- `EMAIL_HOST`
- `EMAIL_PORT`
- (optional) `MONGODB_URI`, `JSONBIN_API_KEY`, `JSONBIN_BIN_ID`, `BREVO_API_KEY`

Add:

- `NODE_ENV` = `production`

## Redeploy

1. Push latest code to GitHub (already done if agent pushed)
2. Railway → your service → **Deployments** → **Redeploy**
3. Open **Deploy Logs** — should end with `Server Running`
4. Open the `*.up.railway.app` URL

## If build still fails

Paste the **last 20 lines** of the red Deploy Log here.

Common fixes:

- **Settings → Build → Builder**: try **Nixpacks** (not Railpack) if custom `nixpacks.toml` is ignored
- **Repo access**: Railway → Settings → reconnect **iamsofiax** GitHub
