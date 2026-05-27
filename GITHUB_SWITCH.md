# Move this project from xsugax → iamsofiax on GitHub

Use **iamsofiax** for a cleaner account. Your code stays on your PC; you only change where GitHub stores the backup and where Railway/Render pull from.

---

## Option A — New repo on iamsofiax (recommended, ~5 minutes)

### 1. Log into GitHub as **iamsofiax**

https://github.com/login

### 2. Create an empty repo

1. **+** → **New repository**
2. Name: **`Main-TOX-EXPRESS`** (same name is fine)
3. **Private** or **Public** — your choice
4. **Do not** add README, .gitignore, or license (repo must be empty)
5. Click **Create repository**

### 3. Point your PC folder at the new repo and push

Open **PowerShell**:

```powershell
cd "C:\Users\MY PC\Desktop\TRANSPORT WORLD"

# Point Git at iamsofiax (not xsugax)
git remote set-url origin https://github.com/iamsofiax/Main-TOX-EXPRESS.git

# Save all current work
git add .
git commit -m "Move to iamsofiax account, migrate off Render"

# First push to new account (GitHub may ask you to sign in as iamsofiax)
git push -u origin main
```

If Git says `branch main` doesn’t exist, try:

```powershell
git push -u origin master
```

If push is **rejected** (remote has commits), and you’re sure the new repo is empty:

```powershell
git push -u origin main --force
```

Only use `--force` on a **brand-new empty** repo.

### 4. Confirm

Open: https://github.com/iamsofiax/Main-TOX-EXPRESS  
You should see `index.html`, `server.js`, `admin.html`, etc.

### 5. Old xsugax repo (optional)

On **xsugax** account:

- **Settings** → bottom → **Delete repository** for `Main-TOX-EXPRESS`, **or**
- Leave it archived so nothing points at it

---

## Option B — Transfer ownership (keeps stars/issues, same repo URL until transfer completes)

Only if **you own both** xsugax and iamsofiax:

1. Log in as **xsugax** → open https://github.com/xsugax/Main-TOX-EXPRESS
2. **Settings** → **Danger Zone** → **Transfer ownership**
3. New owner: **`iamsofiax`**
4. Accept the invite email on **iamsofiax**
5. After transfer, update your PC (URL changes automatically):

```powershell
cd "C:\Users\MY PC\Desktop\TRANSPORT WORLD"
git remote set-url origin https://github.com/iamsofiax/Main-TOX-EXPRESS.git
git fetch origin
```

---

## After GitHub is on iamsofiax

### Railway / Render

1. Log into **Railway** or **Render** with GitHub account **iamsofiax**
2. **New project** → **Deploy from GitHub** → choose **`iamsofiax/Main-TOX-EXPRESS`**
3. Copy variables from your local `.env` again
4. Connect custom domain **toxexpress.org**
5. Disconnect or delete any deploy still tied to **xsugax** / old Render service `the-tox-express`

### Sign in when pushing from PC

Windows may still use **xsugax** saved credentials.

**Clear old login (once):**

1. Windows **Settings** → search **Credential Manager**
2. **Windows Credentials** → remove any `git:https://github.com` entries
3. Next `git push` → browser opens → sign in as **iamsofiax**

Or use GitHub CLI:

```powershell
gh auth login
# Choose GitHub.com → HTTPS → login as iamsofiax
```

---

## Quick reference

| | Old | New |
|---|-----|-----|
| GitHub user | xsugax | **iamsofiax** |
| Repo URL | github.com/xsugax/Main-TOX-EXPRESS | **github.com/iamsofiax/Main-TOX-EXPRESS** |
| Local remote | already updated with `git remote set-url` | |

Your website code and `.env` on your Desktop **do not change** — only GitHub and hosting connections do.
