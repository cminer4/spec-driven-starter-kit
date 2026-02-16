# Next.js Dev & Build Prevention Setup

When using Next.js, add these to prevent recurring dev/build issues (page not loading, webpack cache corruption).

## 1. Package.json Scripts

Add to your `package.json`:

```json
{
  "scripts": {
    "dev": "next dev",
    "dev:safe": "bash scripts/reset-dev-server.sh && npm run dev",
    "verify:dev": "bash scripts/verify-dev-server.sh",
    "build": "next build",
    "build:clean": "rm -rf .next && npm run build",
    "verify:build": "bash scripts/verify-build-health.sh",
    "ensure:build": "bash scripts/ensure-build-health.sh"
  }
}
```

- **dev:safe** — Reset cache and processes, then start dev server. Use when "localhost unable to handle this request".
- **verify:dev** — Health check that dev server is responding. Exit 0 = OK, exit 1 = not responding.
- **build:clean** — Remove build output and rebuild. Use when build fails with ENOENT, MODULE_NOT_FOUND, webpack errors.
- **verify:build** — Verify build output contains expected styling (brand tokens). Assumes build already ran.
- **ensure:build** — Full flow: build:clean → verify:build. If verification fails, runs fix-webpack-error.sh and retries (up to 2 attempts). Use before declaring implementation complete or deploying.

## 2. Next.js Config: Disable Webpack Cache in Development

In `next.config.js` (or `next.config.mjs`), add:

```js
/** @type {import('next').NextConfig} */
const nextConfig = {
  // ... your existing config
  webpack: (config, { dev }) => {
    if (dev) config.cache = false;  // Prevents webpack cache corruption in dev
    return config;
  },
};

module.exports = nextConfig;
```

This reduces incremental build corruption from webpack.

## 3. Scripts (Provided by Template)

The template includes:

- `scripts/verify-dev-server.sh` — Curl localhost, exit 0 for 2xx/3xx
- `scripts/reset-dev-server.sh` — Kill stray processes, clear .next, free ports
- `scripts/fix-webpack-error.sh` — Full clean (reset + cache clear), then rebuild
- `scripts/verify-build-health.sh` — Verifies .next/static/css/*.css contains brand tokens (--color-primary, bg-brand-primary, text-brand-primary). Customize BRAND_MARKERS in script if your project uses different tokens.
- `scripts/ensure-build-health.sh` — build:clean → verify:build; auto-fixes and retries if verification fails

## 4. Verification Requirement

- **Implement command**: Runs `npm run ensure:build` before completion; starts dev server; runs health check after ~5s; retries with reset if check fails. Do not declare complete until ensure:build exits 0.
- **Deploy command**: Runs `npm run ensure:build` before merge/deploy; never deploys a branch that doesn't build or fails build health verification.
- **CI**: Runs `npm run build:clean`, `bash scripts/verify-build-health.sh`, and tests on every push/PR. Job fails if styling is missing.
- **Cursor rule**: `.cursor/rules/dev-server-verification.mdc` — Always verify before declaring success.

## 5. Optional: Turbopack

For faster dev, consider `next dev --turbo` (Turbopack). Add as `dev:turbo` if desired.
