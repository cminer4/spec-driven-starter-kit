# Spec-Driven Development for Non-Technical Founders

## What This Is

A complete workflow system that lets non-technical founders build professional software applications using AI as their entire technical team. No coding knowledge required.

## The Problem This Solves

Traditional software development requires you to either:
1. Learn to code yourself (years of study)
2. Hire expensive developers ($100k+ per engineer)
3. Use no-code tools (limited, inflexible, vendor lock-in)

This system offers a fourth path: **systematically direct AI to build your application** while you remain in control of business decisions.

## Core Principles

### 1. AI Makes Technical Decisions, You Make Business Decisions

**You decide:**
- What features to build
- Who the users are
- What problems to solve
- Timeline and priorities
- User experience preferences

**AI decides:**
- Which programming language and framework
- Database architecture
- Security implementation
- Code structure and patterns
- Testing strategies

### 2. Everything in Plain English

The AI never uses unexplained technical jargon. Every explanation focuses on business impact:
- **Not**: "We'll implement JWT-based authentication with bcrypt hashing"
- **Instead**: "I'll add secure login like Gmail uses. Takes 2 days, prevents account hacking"

### 3. Spec-First, Then Code

No code gets written without a clear specification first. Specs:
- Define what success looks like
- Identify edge cases and risks
- Get documented in plain English
- Become the contract between you and the AI

### 4. Constitution-Driven Projects

Each project has a `CLAUDE.md` file that serves as its "technical constitution" - the rulebook that defines:
- What technology stack is being used
- How code should be structured
- What principles must be followed
- Project-specific constraints and patterns

Every AI interaction references this constitution to stay consistent.

## The 7-Phase Workflow

Building a feature follows a systematic process. Each phase has a specific purpose and deliverable.

### Phase 1: Specification
**What happens**: You describe what you want in plain English. AI creates a detailed spec.

**Deliverable**: 
- Written spec in `specs/features/[feature-name].md`
- Linear ticket created automatically
- Acceptance criteria defined

**Example**: 
- You say: "I need user login with email and password"
- AI creates: 5-page spec with user scenarios, requirements, edge cases, success criteria

### Phase 2: Exploration
**What happens**: AI analyzes your codebase and asks clarifying questions about ambiguities.

**Questions are always business-focused**:
- ✅ "Should users stay logged in for 1 day, 1 week, or until they manually log out?"
- ❌ "Should we use JWT or session-based authentication?" (AI decides this)

**Deliverable**: `specs/explorations/[feature]-exploration.md` documenting:
- What's clear and ready
- What needs your decision
- Risks to consider

### Phase 3: Design
**What happens**: AI proposes UI/UX options and explains tradeoffs.

**Deliverable**: `specs/designs/[feature]-design.md` with:
- User journey walkthrough (step-by-step)
- Screen descriptions in plain English
- Design decisions presented as business tradeoffs
- Familiar app comparisons (e.g., "like Gmail's compose button")

### Phase 4: Planning
**What happens**: AI creates technical implementation plan in business language.

**Deliverable**: `specs/[feature]/plan.md` with:
- What gets built in what order
- Timeline estimates with reasoning
- Risk mitigation strategies
- How testing will work (in user experience terms)

### Phase 5: Implementation
**What happens**: AI writes the code following test-driven development.

**You receive**:
- Progress updates in plain English
- Questions when clarification needed (business questions only)
- Working code that passes all tests

**Deliverable**: 
- Functioning feature
- `specs/[feature]/implementation-log.md`
- Git commits with clear history

### Phase 6: Review
**What happens**: AI acts as senior tech lead reviewing everything before launch.

**Checks**:
- Code quality and best practices
- Security vulnerabilities (explained as business risks)
- Performance issues (explained as user experience impact)
- Design matches original spec

**Deliverable**: `specs/[feature]/review-[timestamp].md` categorizing findings:
- 🚨 **Blockers**: Must fix before shipping
- ⚠️ **Concerns**: Should address
- 💡 **Suggestions**: Nice to have

### Phase 7: Deployment
**What happens**: AI handles production deployment with safety checks.

**Deliverable**: `specs/[feature]/deployment-[timestamp].md` documenting:
- What went live
- How to verify it's working
- Clear rollback instructions if something breaks
- What to monitor

## Project Structure
```
your-app/
├── specs/
│   ├── features/           # Feature specifications
│   ├── explorations/       # Requirements analysis
│   ├── designs/            # UI/UX proposals
│   └── architecture/       # Technical decisions
├── CLAUDE.md               # Project constitution
├── .claude/
│   └── commands/           # Workflow instructions
└── [your actual code]
```

## Key Deliverables

### The Constitution (CLAUDE.md)
Your project's technical rulebook. Defines:
- **Tech stack**: What technologies are being used and why
- **Domain model**: Key concepts in your business (e.g., users, products, orders)
- **Core principles**: Non-negotiable rules (like "always write tests first")
- **Directory structure**: Where different types of code live
- **Gotchas**: Project-specific pitfalls discovered over time

Gets created at project start via bootstrap interview, evolves as project grows.

### Feature Specifications
Every feature starts as a written spec that defines:
- **User scenarios**: Specific situations where feature is used
- **Acceptance criteria**: Given/When/Then format for testability
- **Functional requirements**: Must-have capabilities
- **Edge cases**: Unusual but valid scenarios
- **Success metrics**: How you'll measure if it worked

These become the contract - AI builds exactly what the spec says.

### Linear Integration
Each spec automatically becomes a Linear ticket:
- Spec content is the ticket description
- Ticket URL gets added to spec
- Development progress tracked in Linear
- Complete audit trail

## How AI Acts as Your Technical Team

### As CTO/Architect
- Makes technology stack decisions
- Designs system architecture
- Plans for scale and growth
- Explains tradeoffs in business terms

### As Senior Developer
- Writes clean, maintainable code
- Follows industry best practices
- Implements proper security
- Creates comprehensive tests

### As Tech Lead
- Reviews code before it ships
- Catches bugs and security issues
- Ensures consistency across codebase
- Maintains code quality standards

### As DevOps Engineer
- Handles deployments safely
- Creates rollback procedures
- Sets up monitoring
- Documents what went live

## What You Need to Use This

### Required
- **Cursor IDE** (free code editor with AI built in)
- **Basic computer literacy** (can use files, folders, terminal)
- **GitHub account** (free, for storing your code)
- **Willingness to learn** (not coding, but the workflow)

### Optional But Recommended
- **Linear account** (free tier available, for project tracking)
- **Claude Pro subscription** ($20/month, better AI responses)

### Not Required
- ❌ Coding knowledge
- ❌ Computer science degree
- ❌ Technical background
- ❌ Understanding of databases, APIs, frameworks, etc.

## Time Investment

**Initial setup**: 2-3 hours
- Set up accounts
- Configure tools
- Bootstrap first project

**Per feature thereafter**: Varies by complexity
- Simple feature (login page): 1-2 days
- Medium feature (payment integration): 3-5 days  
- Complex feature (real-time chat): 1-2 weeks

These are **total** times including all 7 phases, not your personal time investment. You spend maybe 2-3 hours per feature answering questions and making decisions. AI does the rest.

## Common Questions

### "How is this different from just asking ChatGPT to write code?"

**ChatGPT/generic AI**:
- One-off conversations, no context
- You copy-paste code without understanding
- No systematic approach
- Quality varies wildly
- No project consistency

**This system**:
- Structured 7-phase workflow
- AI maintains context via CLAUDE.md constitution
- Every feature documented
- Consistent quality enforced
- Complete audit trail

### "Can I switch to hiring developers later?"

Yes! The system creates:
- Clear documentation of every feature
- Well-structured, maintainable code
- Test coverage that proves things work
- Git history showing what changed when

A developer joining later can understand the codebase easily.

### "What if I want to customize or change something?"

You own all the code and specs. You can:
- Ask AI to modify anything
- Change the constitution mid-project
- Switch AI tools (Cursor, ChatGPT, etc.)
- Hire developers to work alongside AI

Nothing is locked in.

### "How much does this cost?"

**Minimal**:
- Cursor: Free
- GitHub: Free tier sufficient
- Linear: Free tier works
- Claude Pro: $20/month (optional but recommended)

**Total**: $0-20/month to run this workflow

Compare to hiring one developer: $8,000-15,000/month

### "What kinds of apps can I build?"

**Well-suited**:
- Web applications (dashboards, SaaS products)
- Mobile apps (iOS/Android)
- Internal tools and automation
- E-commerce and marketplaces
- Content management systems

**Less suited**:
- Cutting-edge AI/ML (requires research)
- Real-time systems with extreme performance needs
- Highly regulated industries (healthcare, finance) without expert review

### "Do I need to learn to code eventually?"

No. The system is designed for you to **never write code** yourself.

However, you will learn:
- How software projects are structured
- How to think systematically about features
- How to make informed technical decisions
- How to communicate with developers (if you hire them later)

This is valuable business knowledge, not coding.

## Success Stories Framework

This methodology works when you:
1. **Trust the process**: Follow all 7 phases, don't skip steps
2. **Ask business questions**: Focus on "what" not "how"
3. **Maintain the constitution**: Keep CLAUDE.md updated
4. **Document everything**: Specs are your source of truth
5. **Start small**: Build MVP features first, iterate

## Getting Started

1. **Review the setup guide**: See companion document for technical setup
2. **Bootstrap your first project**: Answer business questions about your app
3. **Build one simple feature**: Follow the full 7-phase workflow
4. **Learn and adjust**: Improve your process as you go

The first feature takes longest because you're learning the workflow. By your third feature, the process feels natural.

## Support & Resources

- **Template Repository**: Your starting point for every project
- **CURSOR-WORKFLOW-GUIDE.md**: Step-by-step instructions for each phase
- **GETTING-STARTED.md**: Detailed technical setup guide

---

**Bottom line**: This system lets you build real software applications without learning to code. The AI handles all technical decisions while you stay focused on business strategy and user needs.

You've essentially hired an entire technical team for $20/month.
