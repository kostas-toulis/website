# toulis.gr — v2 refresh (work in progress)

This branch (`v2`) is a local-only rebuild of the practice website.
It has **never been pushed to GitHub** and is **not** the production site.

- **Production:** still served from the `master` branch root via GitHub Pages.
- **Domain:** `www.toulis.gr` (CNAME).
- **Rule:** never push, never merge to `master` until an explicit cutover decision.

## Layout

```
.
├── index.html              # /
├── biography/index.html    # /biography
├── services/index.html     # /services (per-condition pages added later)
├── notes/index.html        # /notes (deferred to Phase 4 content)
├── resources/index.html    # /resources (PDFs added later)
├── contact/index.html      # /contact
├── legal/                  # /legal/terms, /legal/privacy (TODO copy)
├── 404.html
├── assets/
│   ├── css/
│   │   ├── tokens.css      # design tokens — single source of truth
│   │   └── globals.css     # reset + base + nav/footer scaffolding
│   ├── js/                 # (intentionally empty — zero JS goal)
│   ├── images/             # ported owner assets
│   └── fonts/              # self-hosted woff2 (TODO)
├── robots.txt
├── sitemap.xml
├── CNAME                   # untouched: www.toulis.gr
├── _legacy/                # the entire current production site, archived
└── README.md
```

## Status

Phase 0 scaffold complete. Each page is a skeleton with proper:

- `lang="el"`, semantic structure, skip-link, focus rings (WCAG AA targets)
- Shared nav + footer markup
- Per-page meta + Open Graph + canonical
- Physician JSON-LD schema on the homepage

Next phase: port the homepage content from
`claude Design/handoff/mockups/homepage.jsx` into `index.html`.

## Local preview

Pages reference assets with absolute paths (`/assets/...`). Open via a local
static server, not by double-clicking the file:

```sh
cd website-refresh
python3 -m http.server 4173
# visit http://localhost:4173
```

## Deploy (later, never automatic)

When v2 is approved for production:

1. Push the `v2` branch to GitHub for review preview only (won't affect www).
2. After sign-off, merge `v2` → `master` in a single explicit step. GitHub
   Pages will republish from the new tree.
3. Keep the legacy tarball in `_baseline-snapshots/` as the rollback artifact.

Until step 1 happens, this is a purely local refresh.
