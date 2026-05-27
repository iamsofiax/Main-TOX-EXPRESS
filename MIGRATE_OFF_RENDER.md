# Move TOX Express OFF Render (step-by-step)

**You are not locked out of your website.** Everything lives here:

| What | Where |
|------|--------|
| Full website code | `C:\Users\MY PC\Desktop\TRANSPORT WORLD` |
| GitHub backup | https://github.com/iamsofiax/Main-TOX-EXPRESS |
| Secrets (email, admin, DB) | `.env` on your PC (same folder) |
| Old Render app name | **`the-tox-express`** → `the-tox-express.onrender.com` |

You do **not** need the old Render dashboard to launch on a new host. You only need it if you want to **cancel billing** on the old account.

---

## Part 1 — Find your old Render account (optional, for canceling)

Try these in order:

1. **GitHub login** (repo: `iamsofiax/Main-TOX-EXPRESS`)
   - Go to https://dashboard.render.com
   - Click **Log in with GitHub**
   - Use the **iamsofiax** GitHub account (after you move the repo — see `GITHUB_SWITCH.md`)

2. **Email search**
   - In Gmail/Outlook, search: `render.com` OR `the-tox-express`
   - Look for “Your Render service is live” or password reset

3. **Google login**
   - Same dashboard → **Log in with Google** (if you used that email)

4. **Forgot password**
   - https://dashboard.render.com → Forgot password → every email you use

5. **Still stuck?** Email Render support: **support@render.com**  
   Say: *“Please delete service `the-tox-express` — I lost dashboard access. Domain toxexpress.org.”*  
   They can cancel the old service using your domain name.

---

## Part 2 — Deploy to a NEW account (recommended: Railway)

Railway is similar to Render but you start fresh with **your** GitHub login.

### A. Push latest code to GitHub (once)

Open PowerShell:

```powershell
cd "C:\Users\MY PC\Desktop\TRANSPORT WORLD"
git add .
git commit -m "Remove splash, improve caching, migrate off Render"
git push origin main
```

If `git push` fails, tell your assistant — we can fix the branch name.

### B. Create Railway project

1. Go to https://railway.app → **Login with GitHub** (use **iamsofiax**)
2. **New Project** → **Deploy from GitHub repo**
3. Choose **`Main-TOX-EXPRESS`**
4. Railway detects Node.js → it will run `npm start` / `node server.js`

### C. Add environment variables (copy from your PC `.env`)

In Railway → your service → **Variables** → add each line from your local `.env` file.

Minimum variables (open `.env` in Notepad and copy values):

| Variable | Purpose |
|----------|---------|
| `ADMIN_PASSWORD` | Admin panel login |
| `EMAIL_USER` / `EMAIL_PASSWORD` | Sending emails |
| `EMAIL_HOST` / `EMAIL_PORT` | SMTP (if set) |
| `BREVO_API_KEY` | Brevo email (if set) |
| `MONGODB_URI` | Database (if set) |
| `JSONBIN_API_KEY` / `JSONBIN_BIN_ID` | Backup storage (if set) |

Do **not** share `.env` with anyone — only paste into Railway’s private Variables screen.

### D. Get your new URL

Railway gives a URL like: `https://main-tox-express-production-xxxx.up.railway.app`  
Open it — you should see your homepage (no Render splash).

### E. Connect your domain `toxexpress.org`

1. Railway → service → **Settings** → **Networking** → **Custom Domain**
2. Add: `toxexpress.org` and `www.toxexpress.org`
3. Railway shows DNS records to add at your **domain registrar** (Namecheap, etc.)

**Current DNS (what you have now):**

```
www  →  CNAME  →  the-tox-express.onrender.com   ← change this
@    →  A      →  216.24.57.7 / .251            ← change to Railway’s values
```

4. At your registrar (where you bought toxexpress.org):
   - Replace **www** CNAME with Railway’s CNAME target
   - Replace **@** A records with Railway’s values (or use their A/CNAME instructions)
5. Wait 15–60 minutes for DNS to update.

### F. Cloudflare (if you use it)

If the domain uses Cloudflare proxy (orange cloud):

- DNS → edit records to point to **Railway**, not `onrender.com`
- SSL/TLS → **Full** or **Full (strict)**

---

## Part 3 — Alternative: NEW Render account (same idea)

If you prefer Render with a **new** login:

1. https://dashboard.render.com → sign up with **your** GitHub (**iamsofiax**)
2. **New** → **Web Service** → connect `Main-TOX-EXPRESS`
3. **Build:** `npm install`  
   **Start:** `node server.js`
4. Copy all variables from your PC `.env` into Render **Environment**
5. Custom domain → `toxexpress.org` → update DNS at registrar (same as Railway)

Use a **new** Render account so you are not hunting the old workspace.

---

## Part 4 — Best long-term fix (no cold starts, no Render branding)

**VPS + your domain** — see `HOSTING_GUIDE.md` (DigitalOcean / Hetzner ~$6/mo).

- Site always on (no “waking up” screen)
- No `x-render-origin-server` headers
- Full control

---

## Quick checklist

- [ ] Confirm site runs locally: `npm install` then `npm start` → http://localhost:3000
- [ ] Push code to GitHub (`iamsofiax/Main-TOX-EXPRESS`)
- [ ] Deploy on Railway (or new Render) from GitHub
- [ ] Paste `.env` values into new host Variables
- [ ] Test new host URL in browser
- [ ] Update DNS at domain registrar (remove `the-tox-express.onrender.com`)
- [ ] Wait for DNS, test https://toxexpress.org
- [ ] (Optional) Log into old Render or email support@render.com to delete old service

---

## If you’re stressed — remember this

1. **Your business site is not inside Render.** It’s on your Desktop and GitHub.
2. **Render is only the machine running it.** Pointing the domain elsewhere moves customers to the new machine.
3. **Your passwords and email keys are in `.env` on your PC** — open with Notepad, copy to the new host.
4. Old Render account = billing cleanup only. Migration works without it.

Need hands-on help? Reply with **where you bought toxexpress.org** (Namecheap, GoDaddy, etc.) — we can fill in the exact DNS rows for Railway.

**Switching GitHub accounts?** Follow **`GITHUB_SWITCH.md`** first.
