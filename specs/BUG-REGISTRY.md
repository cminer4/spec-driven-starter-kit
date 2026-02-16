# Bug Registry

Tracks bugs found during development. Used to prevent regressions and identify patterns.

## Format

| ID | Title | Severity | Root Cause | Spec Updated? | Fixed? |
|----|-------|----------|------------|---------------|--------|
| *(Add rows as bugs are documented via /debug)* |

## Recurring Issues (Prevention in Place)

### Page not loading / "localhost unable to handle this request"
**Root causes:** Port conflicts, multiple dev servers (EMFILE), stale processes.  
**Prevention:** `scripts/reset-dev-server.sh`, `npm run dev:safe`, `scripts/verify-dev-server.sh`. Implement command runs health check after starting dev server; retries with reset if check fails. See [docs/NEXTJS-DEV-BUILD-SETUP.md](../docs/NEXTJS-DEV-BUILD-SETUP.md).

### Webpack cache ENOENT / build corruption
**Root causes:** Corrupted .next cache, incremental webpack builds in bad state.  
**Prevention:** In `next.config.js`, disable webpack cache in dev: `webpack: (config, { dev }) => { if (dev) config.cache = false; return config; }`. Use `npm run build:clean` before deploy; run `scripts/fix-webpack-error.sh` when build fails. Implement and deploy commands require clean build before completion. CI runs `npm run build:clean` on every push/PR. See [docs/NEXTJS-DEV-BUILD-SETUP.md](../docs/NEXTJS-DEV-BUILD-SETUP.md).

## How to Use

- Run `/debug [bug description]` to document a new bug
- Each bug gets a BUG-XXX ID and a full report in `specs/bugs/`
- Use this registry to spot recurring issues and update CLAUDE.md Gotchas
