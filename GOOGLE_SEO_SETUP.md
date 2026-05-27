# Google: rank #1 for "Tox Express" (with star reviews in search)

Your site already has SEO basics. **Google Search Console** is what makes you show up fast for your brand name.

---

## Step 1 — Google Search Console (do this today)

1. Go to **https://search.google.com/search-console**
2. **Add property** → **URL prefix**: `https://toxexpress.org`
3. **Verify ownership** → choose **HTML tag**
4. Copy the `content="..."` code (long string)
5. In **Render** → your service → **Environment** → add:
   ```
   GOOGLE_SITE_VERIFICATION=paste_the_code_here_only_not_the_whole_tag
   ```
6. **Redeploy** → back in Search Console → **Verify**
7. **Sitemaps** → submit: `https://toxexpress.org/sitemap.xml`
8. **URL inspection** → enter `https://toxexpress.org/` → **Request indexing**

Repeat for `https://www.toxexpress.org` if you use www (or set redirect www → non-www).

**Brand searches** ("Tox Express", "TOX Express") often appear within **24–72 hours** after indexing if the domain is live and unique.

---

## Step 2 — Google Business Profile (reviews in Google Maps / local pack)

1. **https://business.google.com** → create profile
2. Business name: **TOX Express Delivery Services**
3. Website: `https://toxexpress.org`
4. Category: **Freight forwarding service** / **Shipping company**
5. Add phone, hours, service areas
6. **Verify** (postcard or phone)
7. Ask real customers for **Google reviews** — this is the main way to get **stars under your listing**

On-site testimonials (already on your homepage) help rich results; **Google Business reviews** help the Maps/local panel.

---

## Step 3 — Optional analytics

In Render Environment add (from https://analytics.google.com → GA4):

```
GA4_MEASUREMENT_ID=G-XXXXXXXXXX
```

Redeploy. Tracks visits from Google search.

---

## What we added in code

- **Title & meta** optimized for "TOX Express" / "Tox Express"
- **Schema.org** Organization + **AggregateRating** + **Review** (matches visible testimonials)
- **Logo & OG image** on your domain (`/assets/logo-512.svg`, `/assets/og-tox-express.svg`)
- **Sitemap** updated; dashboard de-prioritized for SEO
- **IndexNow** key at `https://toxexpress.org/b7e4c2f8a1d9364e5f0c8b7a2d1e9f4c.txt`
- Server pings Google/Bing on startup

---

## Realistic expectations

| Query | Timeline |
|-------|----------|
| **Tox Express** / **TOX Express** (your brand) | Often **#1 in days** once indexed, if no stronger competitor uses the name |
| Generic ("logistics company") | Weeks/months; needs backlinks and content |
| Star ratings in search | Needs valid **Review** schema + real reviews; Google may take **1–4 weeks** to show stars |

**Never buy fake reviews** — Google can penalize the site.

---

## Admin: force re-index

After deploy, log into admin → use **Ping search engines** (if available) or wait for automatic server ping every 4 hours.

---

## Checklist

- [ ] Site live at `https://toxexpress.org` (not 503)
- [ ] `GOOGLE_SITE_VERIFICATION` in Render → redeploy
- [ ] Search Console verified + sitemap submitted
- [ ] Request indexing for homepage
- [ ] Google Business Profile created
- [ ] Search `Tox Express` in incognito after 48–72 hours
