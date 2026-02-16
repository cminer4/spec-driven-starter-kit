# Spec-Driven Development Starter Kit

A reusable template for building applications with AI assistance. Designed for **non-technical founders** — all interactions use business language, not technical jargon.

## What's Included

- **9 Slash Commands**: `/bootstrap`, `/new-spec`, `/explore`, `/design`, `/plan`, `/implement`, `/review`, `/deploy`, `/debug`
- **CLAUDE.md Constitution**: Project-specific technical rulebook (customized via `/bootstrap`)
- **Spec-Driven Workflow**: Specs before code — Linear integration, TDD enforcement
- **Linear MCP Integration**: Create tickets from specs, link commits and branches
- **Non-Technical Founder Mode**: AI makes technical decisions; explains in business terms

## Quick Start

### 1. Clone & Disconnect from Template

```bash
git clone <this-repo-url> my-new-app
cd my-new-app
rm -rf .git
git init
git add .
git commit -m "Initial commit from spec-driven starter kit"
```

### 2. Bootstrap Your Project

Open in **Cursor** (or Claude Code) and run:

```
/bootstrap
```

Answer the interview questions. The AI will:
- Customize CLAUDE.md for your project
- Recommend tech stack (Next.js, Rails, etc.)
- Optionally create a Linear project
- Set up branding/design guidelines if you have them

### 3. Create Your First Feature

```
/new-spec Add user authentication
```

This creates a spec and Linear ticket. Then follow the workflow: `/explore` → `/design` → `/plan` → `/implement` → `/review` → `/deploy`.

## Local Development

### Running the app

```bash
npm install
npm run dev
```

Open the URL shown in the terminal (e.g. http://localhost:3000 or http://localhost:3001).

### If the build fails after code changes

Build cache can get corrupted. Run:

```bash
npm run build:clean
```

Or for a full reset: `bash scripts/fix-webpack-error.sh` then `npm run build`.

### If the page won't load

Port conflicts and stale processes can cause the app to break. Run:

```bash
bash scripts/reset-dev-server.sh
npm run dev
```

This stops any stray dev servers, clears the build cache, and frees ports. Then start fresh.

### Important: one dev server at a time

Only run one `npm run dev` at a time. Leaving multiple instances running (or starting new ones without stopping old ones) exhausts system resources and causes "page not loading" or "too many open files" errors.

Always use the URL printed in the terminal — if port 3000 is taken, Next.js will use 3001, 3002, etc. Visiting the wrong port shows a stale or broken app.

## Project Structure

```
├── .claude/commands/       # Slash commands (bootstrap, new-spec, explore, etc.)
├── .cursor/mcp.json       # Linear MCP config (Cursor)
├── specs/
│   ├── templates/         # FEATURE_TEMPLATE.md, ARCHITECTURE_TEMPLATE.md
│   ├── features/          # Feature specifications
│   ├── explorations/      # Requirement analysis (from /explore)
│   ├── designs/           # UI/UX explorations (from /design)
│   ├── bugs/              # Bug reports (from /debug)
│   ├── BUG-REGISTRY.md    # Master bug list
│   └── architecture/      # Architecture decision records
├── CLAUDE.md              # Project constitution (customize per project)
├── GUIDE.md               # Complete guide (setup, commands, workflow)
└── docs/
    └── MCP-LINEAR-TROUBLESHOOTING.md
```

## The Workflow

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `/bootstrap` | Set up new project, customize CLAUDE.md |
| 2 | `/new-spec [feature]` | Create spec + Linear ticket |
| 3 | `/explore [spec]` | Analyze requirements, identify ambiguities |
| 4 | `/design [spec]` | Explore UI/UX options |
| 5 | `/plan [spec]` | Create implementation plan |
| 6 | `/implement [spec]` | Build the feature (TDD) |
| 7 | `/review [spec]` | Code review before merge |
| 8 | `/deploy [spec]` | Deploy to production |
| 9 | `/debug [bug]` | Investigate bug, create ticket, update BUG-REGISTRY |

## Linear Setup

1. **Enable Linear MCP** in Cursor: Settings → Features → MCP → Add Linear
2. **Or** ensure `.cursor/mcp.json` exists with the Linear config (see [docs/MCP-LINEAR-TROUBLESHOOTING.md](docs/MCP-LINEAR-TROUBLESHOOTING.md))
3. **Authenticate** when prompted (OAuth — no API key needed)
4. **Choose workspace** when connecting (e.g., CM Personal Workspace)

## Documentation

- **[GUIDE.md](GUIDE.md)** — Complete guide: setup, all 9 commands, workflow, spec process, troubleshooting
- **[docs/MCP-LINEAR-TROUBLESHOOTING.md](docs/MCP-LINEAR-TROUBLESHOOTING.md)** — Linear MCP setup and fixes

## Key Principles

- **No code without a spec** — Every feature is specified first
- **AI makes technical decisions** — You answer business questions only
- **TDD enforced** — Tests before implementation
- **Constitution-first** — CLAUDE.md defines all technical rules

## Using as a Template

This repo is a **template for future projects**. Copy it to start new apps. Run `/bootstrap` to customize CLAUDE.md, then use the slash commands to build features spec-first.
