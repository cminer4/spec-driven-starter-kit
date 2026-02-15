# Getting Started with Spec-Driven Development Workflow

## What You've Built

This is a complete development workflow system designed for **non-technical founders** to build applications with AI assistance. It includes:

- **7 Slash Commands**: `/bootstrap`, `/new-spec`, `/explore`, `/design`, `/plan`, `/implement`, `/review`, `/deploy`
- **CLAUDE.md Constitution**: A template that defines your project's technical rules
- **Spec-Driven Methodology**: A structured approach to building features
- **Linear Integration**: Automatic ticket creation and tracking
- **Non-Technical Founder Mode**: All AI interactions use business language, not technical jargon

---

## Quick Start: Starting a New Project

### Step 1: Clone the Template
```bash
cd ~/
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

You have two options:

**Option A: Cursor IDE (Recommended for Visual Interface)**
- Open Cursor
- File > Open Folder > Select my-new-app
- Use Cursor's AI chat (Cmd+L) for conversations
- Commands work conversationally, not as slash commands

**Option B: Claude Code CLI (Recommended for Terminal Users)**
- Requires slash commands to be installed globally
- See "Installing Slash Commands" section below

---

## Installing Slash Commands (For Claude Code)

Your slash commands live in `.claude/commands/` but Claude Code looks for them in `~/.claude/skills/`.

**One-time setup:**
```bash
# Copy all commands to global skills directory
mkdir -p ~/.claude/skills
cp /path/to/your/template/.claude/commands/*.md ~/.claude/skills/
```

**Each command needs this frontmatter format:**
```yaml
---
name: command-name
description: What this command does
argument-hint: (description of arguments)
disable-model-invocation: true
---
```

**Verify installation:**
```bash
claude
# Then try: /new-spec, /explain, etc.
```

---

## The 7 Commands Explained

### 1. `/bootstrap` (or manual interview)
**When**: Starting a new project
**What it does**: Interviews you about your app and customizes CLAUDE.md
**Questions it asks**:
- What does your app do?
- Web or mobile?
- Who are the users?
- Does it handle payments?
- Timeline and budget constraints?

**If `/bootstrap` doesn't work in Claude Code:**
Use Cursor and ask: "Interview me to bootstrap this project and fill in the CLAUDE.md constitution"

---

### 2. `/new-spec` [feature description]
**When**: Starting a new feature
**What it does**: 
- Creates detailed spec in `specs/features/`
- Creates Linear ticket
- Links spec and ticket

**Example**:
```
/new-spec Add user authentication with email and password
```

**Output**: 
- `specs/features/user-authentication.md`
- Linear ticket with full spec as description
- Spec updated with ticket URL

---

### 3. `/explore` [ticket-id or spec path]
**When**: After creating a spec, before designing
**What it does**:
- Analyzes your codebase
- Identifies integration points
- Asks clarifying BUSINESS questions (never technical)
- Flags ambiguities and risks

**Example**:
```
/explore ENG-123
```

**Output**: `specs/explorations/user-auth-exploration.md`

**Key principle**: NEVER writes code. Only asks questions and analyzes.

---

### 4. `/design` [ticket-id or spec path]
**When**: After exploration, before planning
**What it does**:
- Explores UI/UX options
- Presents design decisions as business tradeoffs
- Creates user journey walkthrough
- Identifies accessibility needs

**Example**:
```
/design ENG-123
```

**Output**: `specs/designs/user-auth-design.md`

**Key principle**: Uses familiar app analogies (Gmail, Spotify, etc.)

---

### 5. `/plan` [ticket-id or spec path]
**When**: After design is approved
**What it does**:
- Creates technical implementation plan
- Breaks work into phases
- Identifies dependencies and risks
- Estimates timeline
- ALL in business language

**Example**:
```
/plan ENG-123
```

**Output**: `specs/user-auth/plan.md`

**Key principle**: Makes all technical decisions, explains in business terms

---

### 6. `/implement` [ticket-id or spec path]
**When**: After plan is approved
**What it does**:
- Writes code following TDD (tests first)
- Provides progress updates
- Asks business questions if clarification needed
- Creates git commits

**Example**:
```
/implement ENG-123
```

**Output**: 
- Working code in appropriate directories
- `specs/user-auth/implementation-log.md`
- Git commits on feature branch

**Key principle**: Keeps you informed in plain English

---

### 7. `/review` [ticket-id or spec path]
**When**: After implementation, before merging
**What it does**:
- Checks code quality, tests, security
- Verifies design matches spec
- Flags blockers, concerns, suggestions
- Explains issues in business impact terms

**Example**:
```
/review ENG-123
```

**Output**: `specs/user-auth/review-[timestamp].md`

**Categories**:
- 🚨 Blockers (must fix)
- ⚠️ Concerns (should fix)
- 💡 Suggestions (nice to have)

---

### 8. `/deploy` [ticket-id or spec path]
**When**: After review passes
**What it does**:
- Pre-deployment checklist
- Handles deployment process
- Creates deployment record
- Provides rollback instructions

**Example**:
```
/deploy ENG-123
```

**Output**: `specs/user-auth/deployment-[timestamp].md`

**Key principle**: Clear rollback steps, monitors for issues

---

## The Workflow (Full Feature Lifecycle)
```
1. /new-spec "Add user dashboard"
   → Creates spec + Linear ticket

2. /explore ENG-124
   → Analyzes requirements, asks clarifying questions
   → You answer business questions

3. /design ENG-124
   → Proposes UI/UX options
   → You choose design direction

4. /plan ENG-124
   → Creates implementation plan with timeline
   → You review and approve

5. /implement ENG-124
   → Builds the feature
   → Keeps you updated in plain English

6. /review ENG-124
   → Checks everything before launch
   → You fix any blockers

7. /deploy ENG-124
   → Ships to production
   → Documents what went live
```

---

## CLAUDE.md Constitution

Every project needs a customized `CLAUDE.md` file. This is your project's technical rulebook.

**Key sections**:
- **Core Principles**: Non-Technical Founder Mode, TDD enforcement, etc.
- **Tech Stack**: Language, framework, database, testing tools
- **Domain Model**: Key entities and relationships for your app
- **Directory Contract**: Where code files go
- **Gotchas**: Project-specific pitfalls discovered over time

**How it gets filled in**:
- `/bootstrap` command interviews you and fills it in
- Or manually customize the template

**Why it matters**:
Every command references CLAUDE.md to understand your project context.

---

## Troubleshooting

### Problem: Slash commands don't work in Claude Code

**Solution 1**: Verify skills are installed
```bash
ls ~/.claude/skills/
# Should show: bootstrap.md, new-spec.md, etc.
```

**Solution 2**: Check frontmatter format
```bash
head -6 ~/.claude/skills/bootstrap.md
```

Should look like:
```yaml
---
name: bootstrap
description: Guide a non-technical founder...
argument-hint: (no arguments - interactive interview)
disable-model-invocation: true
---
```

**Solution 3**: Use Cursor instead
Open project in Cursor, use AI chat conversationally instead of slash commands.

---

### Problem: Commands not in template when I clone

**Cause**: The `.claude/` directory wasn't pushed to GitHub

**Solution**: 
```bash
cd /Users/charlesminer/my-app
git add .claude/
git commit -m "Add slash commands to template"
git push
```

Then re-clone for new projects.

---

### Problem: Bootstrap skips interview and makes assumptions

**Cause**: The command executed without waiting for answers

**Solution**: 
In Cursor, manually ask: "Interview me to bootstrap this project. Ask me business questions about my app and fill in CLAUDE.md based on my answers."

---

### Problem: Linear integration not working

**Check**:
1. Do you have a Linear account?
2. Is Linear MCP server configured in `.mcp.json`?
3. Did you authenticate via OAuth?

**Fix**:
See Linear MCP setup in original conversation history.

---

## File Structure
```
my-app/
├── .claude/
│   └── commands/           # Slash commands (if using Claude Code)
│       ├── bootstrap.md
│       ├── new-spec.md
│       ├── explore.md
│       ├── design.md
│       ├── plan.md
│       ├── implement.md
│       ├── review.md
│       └── deploy.md
├── specs/
│   ├── templates/          # Reusable templates
│   ├── features/           # Feature specs
│   ├── explorations/       # Requirement analysis
│   ├── designs/            # UI/UX explorations
│   └── architecture/       # Technical decisions
├── CLAUDE.md               # Project constitution (customize per project)
├── README.md               # Project overview
├── SPEC-DRIVEN-WORKFLOW.md # Methodology explanation
└── GETTING-STARTED.md      # This guide
```

---

## Key Principles

### 1. Non-Technical Founder Mode
- AI makes ALL technical decisions
- Questions are ALWAYS in business terms
- Explanations focus on business impact (time, cost, risk, UX)
- No jargon without translation

### 2. Spec-Driven Development
- No code without a spec
- Specs evolve as you learn
- Specs become the contract

### 3. Test-Driven Development (TDD)
- Tests written BEFORE code
- Red → Green → Refactor cycle
- Enforced in constitution

### 4. Constitution-First
- CLAUDE.md defines all technical rules
- Commands respect the constitution
- Constitution evolves with project

---

## Communication Examples

### ✅ Good (Business Language)
- "This makes the dashboard load 10x faster for users"
- "I'll add secure login (like Gmail uses). Takes 2 days, prevents account hacking"
- "Password reset emails will expire after 24 hours - industry standard for security"

### ❌ Bad (Technical Jargon)
- "Implemented Redis caching with 60s TTL"
- "Using bcrypt hashing with salt rounds of 10"
- "OAuth 2.0 with PKCE flow and refresh tokens"

---

## Next Steps

1. **Push template to GitHub** (if not done)
```bash
   cd /Users/charlesminer/my-app
   git add .claude/
   git commit -m "Add complete slash command system"
   git push
```

2. **Test with your rent-roll-app**
   - Open in Cursor
   - Interview process to fill in CLAUDE.md
   - Create first spec with `/new-spec` (or conversationally)

3. **Build your first feature**
   - Follow the 7-command workflow
   - Document any gotchas in CLAUDE.md

4. **Improve the system**
   - Add lessons learned to templates
   - Update commands if you find better patterns
   - Push improvements back to template

---

## Support & Resources

- **Template Repository**: https://github.com/charlesminer-art/spec-driven-starter-kit
- **Claude Code Issues**: https://github.com/anthropics/claude-code/issues
- **This was built**: February 14, 2026
- **Full conversation transcript**: `/mnt/transcripts/2026-02-15-01-08-11-spec-driven-dev-setup.txt`

---

## Remember

You've built something valuable here. This system lets you build professional software despite having zero coding experience. The AI acts as your entire technical team - CTO, architect, senior developer, and tech lead all in one.

The key is trusting the system:
- Let AI make technical decisions
- Focus on business questions
- Follow the workflow
- Reference CLAUDE.md constantly

Good luck building! 🚀
