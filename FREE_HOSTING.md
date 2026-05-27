# Host TOX Express for FREE (no card required for testing)

Railway asked you to pay — **skip Railway for now.**  
**Render’s free tier** is still the closest to what you had before: deploy free, test free, pay only if you upgrade later.

---

## Best free option: Render (new account = iamsofiax)

### Step 1 — Deploy (no custom domain yet = no conflict)

1. https://dashboard.render.com → **Log in with GitHub** → **iamsofiax**
2. **New +** → **Web Service**
3. Connect **Main-TOX-EXPRESS**
4. Settings:
   - **Instance type:** **Free** (not Starter/Paid)
   - **Build command:** `npm install`
   - **Start command:** `node server.js`
   - **Branch:** `main`
5. **Environment** → paste every line from your local `.env`
6. Add: `NODE_ENV` = `production`
7. Click **Create Web Service**

### Step 2 — Test on the FREE URL (no Namecheap changes)

When deploy is **Live**, open:

`https://YOUR-SERVICE-NAME.onrender.com`

( Render shows this on the service page — **not** toxexpress.org yet. )

Test:

- Homepage loads  
- Tracking search  
- Admin: `https://YOUR-SERVICE-NAME.onrender.com/admin.html`

**This costs $0.** Free tier sleeps after ~15 min idle; first visit may show a short “starting” screen — that’s normal on free Render.

### Step 3 — Custom domain (only when ready)

**toxexpress.org** is still locked on the **old** `the-tox-express` service. Until Render support releases it, keep testing on `*.onrender.com`.

When the domain is free:

- Render → your **new** service → **Custom Domains** → add `toxexpress.org` / `www`
- Update Namecheap DNS with the values Render shows

---

## Why Railway asked for payment

Many new Railway accounts need a **credit card** even for trial credit. That’s not the same as Render’s **Free** web service tier.

You do **not** need Railway to test your site.

---

## Other free options (if Render fails)

| Host | Free? | Notes |
|------|-------|--------|
| **Render** | Yes | Easiest match to your setup; may sleep |
| **Fly.io** | Small free allowance | Needs `fly launch` / CLI |
| **Koyeb** | Free tier | Node supported |
| **VPS trial** | Sometimes | More setup |

Stick with **Render free + `*.onrender.com` URL** until you’re happy, then connect the domain.

---

## What you already have (no extra cost)

- Code on GitHub: **iamsofiax/Main-TOX-EXPRESS**
- `.env` on your PC (secrets — paste into Render Environment)
- `render.yaml` in the repo (Render can auto-detect build/start)

---

## Quick checklist

- [ ] Render → **Free** instance  
- [ ] Repo: **Main-TOX-EXPRESS**  
- [ ] `.env` values in Render **Environment**  
- [ ] Test **`https://xxxx.onrender.com`** (not toxexpress.org yet)  
- [ ] Email Render support later to free **toxexpress.org** from old app  

You can run the full business site on the free `onrender.com` link while you test — customers can use that URL until DNS is moved.
