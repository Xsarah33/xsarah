# XSarah Pre-Task Plans

Phone-installable web app for construction pre-task plans: permits, hazards, PPE, photos, crew sign-on, and a 3-stage review (supervisor → safety professional → GC safety rep).

## What's in here
| File | What it does |
|---|---|
| `index.html` | The app |
| `config.js` | Your Supabase Project URL and **publishable** key (never the secret key) |
| `supabase-setup.sql` | Creates the database tables and access rules |
| `manifest.webmanifest`, `sw.js`, icons | Let phones install it like an app |

## Setup (one time)
1. **Supabase → SQL Editor → New query**: paste `supabase-setup.sql`, click **Run**.
2. **GitHub**: create a repository named `xsarah`, then **Add file → Upload files** and drag in every file from this folder. Commit.
3. **GitHub**: open `config.js` → pencil icon → paste your Project URL and publishable key → Commit.
4. **Vercel → Add New → Project**: import the `xsarah` repo. Framework preset: **Other**. Leave build settings empty. Click **Deploy**.
5. **Supabase → Authentication → URL Configuration**: set **Site URL** to your Vercel address (for example `https://xsarah.vercel.app`) and add the same address under **Redirect URLs**. Save.
6. On your phone, open the Vercel address, sign in with your email link, then **Add to Home Screen**.

## Notes
- Anyone who signs in with an email can use the app. To limit it to people you invite, turn off **Allow new users to sign up** in Supabase → Authentication → Sign In / Providers, then invite people from Authentication → Users.
- Supabase's built-in email is rate-limited (a few sign-in emails per hour). Fine for testing; set up custom SMTP before a wider rollout.
- Every change you commit to GitHub goes live on Vercel automatically.
