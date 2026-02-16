# Spec-Driven Development: Complete Guide

A comprehensive guide to the spec-driven development workflow for non-technical builders. This merges setup, commands, workflow, and reference into one place.

---

## Part 1: Why This Exists

### What This Is

A complete workflow system that lets non-technical creators build professional software applications using AI as their entire technical team. No coding knowledge required.

### The Problem This Solves

Traditional software development requires you to either:
1. Learn to code yourself (years of study)
2. Hire expensive developers ($100k+ per engineer)
3. Use no-code tools (limited, inflexible, vendor lock-in)

This system offers a fourth path: **systematically direct AI to build your application** while you remain in control of business decisions.

### Core Principles

**1. AI Makes Technical Decisions, You Make Business Decisions**

- **You decide:** What features to build, who the users are, what problems to solve, timeline, user experience
- **AI decides:** Language and framework, database, security, code structure, testing strategies

**2. Everything in Plain English**

- **Not:** "We'll implement JWT-based authentication with bcrypt hashing"
- **Instead:** "I'll add secure login like Gmail uses. Takes 2 days, prevents account hacking"

**3. Spec-First, Then Code**

No code gets written without a clear specification first. Specs define success, identify edge cases, and become the contract between you and the AI.

**4. Constitution-Driven Projects**

Each project has a `CLAUDE.md` file — the technical rulebook. Every AI interaction references it to stay consistent.

---

## Part 2: Quick Start

### Step 1: Clone the Template

```bash
git clone https://github.com/charlesminer-art/spec-driven-starter-kit.git my-new-app
cd my-new-app
```

### Step 2: Disconnect from Template Repository

```bash
rm -rf .git
git init
git add .
git commit -m "Initial commit from spec-driven starter kit"
```

### Step 3: Choose Your AI Tool

**Option A: Cursor IDE (Recommended)**
- Open Cursor → File > Open Folder > Select my-new-app
- Use AI chat (Cmd+L)
- Slash commands work in Cursor

**Option B: Claude Code CLI**
- Requires copying commands to `~/.claude/skills/`
- See "Installing Slash Commands" below

### Step 4: Bootstrap Your Project

Run `/bootstrap` and answer the interview questions. The AI will customize CLAUDE.md, recommend tech stack, optionally create a Linear project, and set up branding guidelines.

### Step 5: Create Your First Feature

```
/new-spec Add user authentication
```

Then follow: `/explore` → `/design` → `/plan` → `/implement` → `/review` → `/deploy`.

---

## Part 3: Installing Slash Commands (Claude Code Only)

Your slash commands live in `.claude/commands/` but Claude Code looks for them in `~/.claude/skills/`.

```bash
mkdir -p ~/.claude/skills
cp /path/to/your/template/.claude/commands/*.md ~/.claude/skills/
```

Verify: Run `claude` and try `/new-spec`, `/explain`, etc.

---

## Part 4: The 10 Commands

### 1. `/bootstrap`
**When:** Starting a new project  
**What:** Interviews you, customizes CLAUDE.md, optionally creates Linear project  
**Questions:** App purpose, platform, users, payments, timeline, branding, Linear project

### 2. `/new-spec` [feature description]
**When:** Starting a new feature  
**What:** Creates spec in `specs/features/`, creates Linear ticket, links them  
**Example:** `/new-spec Add user authentication with email and password`

### 3. `/explore` [ticket-id or spec path]
**When:** After creating a spec, before designing  
**What:** Analyzes codebase, asks clarifying business questions, flags ambiguities  
**Output:** `specs/explorations/[feature]-exploration.md`  
**Principle:** Never writes code — only asks questions and analyzes

### 4. `/design` [ticket-id or spec path]
**When:** After exploration, before planning  
**What:** Explores UI/UX options, user journey, design decisions as business tradeoffs  
**Output:** `specs/designs/[feature]-design.md`  
**Principle:** Uses familiar app analogies (Gmail, Spotify, etc.)

### 5. `/plan` [ticket-id or spec path]
**When:** After design is approved  
**What:** Creates implementation plan, phases, timeline, dependencies — all in business language  
**Output:** `specs/[feature]/plan.md`  
**Principle:** Makes all technical decisions, explains in business terms

### 6. `/implement` [ticket-id or spec path]
**When:** After plan is approved  
**What:** Writes code following TDD, progress updates, git commits  
**Output:** Working code, `specs/[feature]/implementation-log.md`  
**Principle:** Keeps you informed in plain English

### 7. `/review` [ticket-id or spec path]
**When:** After implementation, before merging  
**What:** Checks code quality, tests, security; verifies design matches spec  
**Output:** `specs/[feature]/review-[timestamp].md`  
**Categories:** 🚨 Blockers | ⚠️ Concerns | 💡 Suggestions

### 8. `/deploy` [ticket-id or spec path]
**When:** After review passes  
**What:** Pre-deployment checklist, deployment, deployment record, rollback instructions  
**Output:** `specs/[feature]/deployment-[timestamp].md`

### 9. `/debug` [bug description or ticket ID]
**When:** A bug is found  
**What:** Bug report, Linear ticket, investigation, BUG-REGISTRY update, constitution recommendations. Phase 6 (Deploy Fix) automatically deploys fixes when you say "fix it".  
**Output:** `specs/bugs/[slug]-report.md`, `specs/BUG-REGISTRY.md` updated

### 10. `/commit` [optional message]
**When:** After making changes, anytime during development  
**What:** Creates well-formatted git commit with conventional format, links to Linear ticket from branch name  
**Example:** `/commit Add login validation` or `/commit` (proposes message from changes)  
**Principle:** Clear, descriptive commits; present tense; includes ticket ref when applicable

---

## Part 5: The Full Feature Lifecycle

```
1. /new-spec "Add user dashboard"     → Spec + Linear ticket
2. /explore ENG-124                  → Clarify requirements
3. /design ENG-124                   → UI/UX options
4. /plan ENG-124                     → Implementation plan
5. /implement ENG-124                → Build the feature
6. /review ENG-124                   → Code review
7. /deploy ENG-124                   → Ship to production
```

---

## Part 6: Spec Process & Templates

### When to Use Each Template

| Template | Use For | Location |
|----------|---------|----------|
| [FEATURE_TEMPLATE.md](specs/templates/FEATURE_TEMPLATE.md) | Features, user-facing behavior, API contracts | `specs/features/` |
| [ARCHITECTURE_TEMPLATE.md](specs/templates/ARCHITECTURE_TEMPLATE.md) | Tech choices, structural decisions, design patterns | `specs/architecture/` |

### Spec Workflow Steps

1. **Specify** — Copy template, fill in. Good specs answer: What? Why? Acceptance criteria?
2. **Review** — Validate testable, unambiguous; resolve open questions
3. **Implement** — Code fulfills spec; update spec if gaps discovered
4. **Verify** — Confirm implementation matches spec; update status to Implemented

### Spec Quality Guidelines

- **Summary** — One or two sentences
- **Motivation** — Connects to real need
- **Requirements** — Clear, testable criteria; success and failure behavior
- **Edge Cases** — Don't leave implicit
- **Out of Scope** — Explicit exclusions
- **Open Questions** — Unresolved decisions

### File Naming

- **Features:** `{TICKET-ID}-{feature-slug}.md` (e.g., `ENG-123-dark-mode.md`)
- **Architecture:** `kebab-case.md` or `ADR-001-decision-name.md`

---

## Part 7: Linear Integration

- **Spec naming:** `{TICKET-ID}-{feature-slug}.md`
- **Frontmatter:** Include `linear` (URL) and `ticket` (ID)
- **Commit format:** `{TICKET-ID} Short description`
- **Branch naming:** `{ticket-id}-{short-description}`

See [docs/MCP-LINEAR-TROUBLESHOOTING.md](docs/MCP-LINEAR-TROUBLESHOOTING.md) for setup.

---

## Part 8: Code Review Process

- **Spec review before implementation** — Spec must be Approved before code
- **Checklist:** Spec alignment, acceptance criteria, edge cases, out of scope, tests
- **When implementation reveals gaps:** Update spec first, note the change, then implement

---

## Part 9: Debugging & Iteration

- **Update spec first** when bugs reveal spec gaps
- **In-scope edge case** → Add to spec, implement handling
- **Out-of-scope edge case** → Add to Out of Scope
- **Use `/debug`** for systematic bug investigation
- **Spec amendments vs new specs:** Amend for same feature; new spec for new feature

---

## Part 10: Work in Progress

- **Status values:** Draft | In Review | Approved | In Progress | Implemented
- **Pausing:** Update status, commit, note blockers
- **Resuming:** Checkout branch, open spec, point AI to spec

---

## Part 11: CLAUDE.md Constitution

Your project's technical rulebook. Key sections:
- **Core Principles** — Non-Technical Founder Mode, TDD, etc.
- **Tech Stack** — Language, framework, database, testing
- **Domain Model** — Key entities and relationships
- **Directory Contract** — Where code files go
- **Gotchas** — Project-specific pitfalls

Filled in via `/bootstrap` or manual customization.

---

## Part 12: What You Need

**Required:** Cursor IDE, basic computer literacy, GitHub account  
**Optional:** Linear account, Claude Pro ($20/month)  
**Not required:** Coding knowledge, technical background

**Time investment:** 2-3 hours initial setup; 1-2 days per simple feature (total, not your time)

---

## Part 13: Common Questions

**"How is this different from ChatGPT?"** — Structured workflow, CLAUDE.md context, every feature documented, consistent quality.

**"Can I hire developers later?"** — Yes. Clear docs, maintainable code, test coverage, git history.

**"How much does it cost?"** — $0-20/month vs $8,000-15,000/month for one developer.

**"Do I need to learn to code?"** — No. You'll learn project structure and how to think about features.

---

## Part 14: Troubleshooting

**Slash commands don't work in Claude Code:** Verify skills in `~/.claude/skills/`; check frontmatter; or use Cursor instead.

**Bootstrap skips interview:** In Cursor, ask: "Interview me to bootstrap this project and fill in CLAUDE.md."

**Linear not working:** Check `.cursor/mcp.json`, Cursor Settings → MCP, OAuth. See [docs/MCP-LINEAR-TROUBLESHOOTING.md](docs/MCP-LINEAR-TROUBLESHOOTING.md).

---

## Part 15: File Structure

```
├── .claude/commands/       # Slash commands
├── .cursor/mcp.json       # Linear MCP config
├── specs/
│   ├── templates/
│   ├── features/
│   ├── explorations/
│   ├── designs/
│   ├── bugs/
│   ├── BUG-REGISTRY.md
│   └── architecture/
├── CLAUDE.md
├── README.md
├── GUIDE.md               # This guide
└── docs/
    └── MCP-LINEAR-TROUBLESHOOTING.md
```

---

## Part 16: Communication Examples

**✅ Good:** "This makes the dashboard load 10x faster for users"  
**❌ Bad:** "Implemented Redis caching with 60s TTL"

**✅ Good:** "I'll add secure login (like Gmail uses). Takes 2 days, prevents account hacking"  
**❌ Bad:** "Using bcrypt hashing with salt rounds of 10"

---

## Part 17: Key Principles

1. **Non-Technical Founder Mode** — AI makes technical decisions; questions in business terms
2. **Spec-Driven Development** — No code without a spec; specs are the contract
3. **TDD Enforced** — Tests before code; Red → Green → Refactor
4. **Constitution-First** — CLAUDE.md defines all technical rules

---

**Bottom line:** This system lets you build real software without learning to code. The AI handles technical decisions while you focus on business strategy. Trust the process, follow the workflow, reference CLAUDE.md constantly. Nice job, now go make something people want! 🚀
