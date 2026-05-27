# Customers never see Render (or any host “waking up”)

## How it works

| URL | What customers get | Why |
|-----|-------------------|-----|
| **toxexpress.org** | HTML/CSS/JS from **Cloudflare Pages** | Always online, global CDN, **no Node server to start** |
| **api.toxexpress.org** | Railway (tracking, map, admin API only) | Customers never open this URL in the browser bar |

When someone visits **toxexpress.org**, Cloudflare serves your site **immediately**. Render/Railway are **not** involved in loading the homepage.

Tracking still works: `js/config.js` sends API calls to `https://api.toxexpress.org` in the background only.

---

## One-time DNS setup (do this once)

At your domain registrar (or Cloudflare DNS):

### 1. Customer site → Cloudflare Pages

1. https://dash.cloudflare.com → **Workers & Pages** → **Create** → **Pages**
2. **Connect to Git** → **iamsofiax** / **Main-TOX-EXPRESS**
3. Build settings:
   - **Build command:** `npm run build:static`
   - **Build output directory:** `dist`
   - **Node version:** 18
4. Deploy → note your `*.pages.dev` URL and test it
5. **Custom domains** → add **toxexpress.org** and **www.toxexpress.org**
6. Cloudflare will show DNS records — apply them (often automatic if DNS is on Cloudflare)

### 2. API + admin → Railway only

1. Railway project → **Settings** → **Networking** → custom domain: **api.toxexpress.org**
2. DNS:
   ```
   Type   Name   Value (from Railway)
   CNAME  api    xxxxx.up.railway.app
   ```

### 3. Remove old Render

Delete or change these if they still exist:

```
www  CNAME  the-tox-express.onrender.com   ← DELETE
@    A      216.24.57.x                    ← REPLACE with Cloudflare Pages
```

After DNS propagates (~15–60 min), **toxexpress.org never touches Render again.**

---

## Verify

1. Open **toxexpress.org** — page loads instantly (no “Starting…” screen)
2. DevTools → **Network** → first document should be from **Cloudflare**, not `onrender.com`
3. Test tracking — requests go to **api.toxexpress.org** only
4. Admin: **https://api.toxexpress.org/admin** (bookmark this; not linked on the public site)

---

## If everything is still on Railway only (temporary)

Until Cloudflare Pages is set up, use Railway **paid** plan (no sleep) or a VPS so the monolith does not spin down. That still avoids **Render** branding but is not as fast as Pages for the homepage.

The **Pages + api** split is the permanent fix.
