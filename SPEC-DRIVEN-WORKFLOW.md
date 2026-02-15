# Spec-Driven Development Workflow

This document describes the process for developing features and making architecture decisions in this project. Specifications are written **before** implementation and serve as the source of truth.

## Overview

Spec-driven development means:

1. **No code without a spec** — Every feature and significant architecture decision is documented first.
2. **Specs are the contract** — Implementation must fulfill the spec; the spec defines *what* and *why*, not *how*.
3. **Specs evolve** — When requirements change, update the spec before or alongside the code.

## When to Use Each Template

| Template | Use For | Location |
|----------|---------|----------|
| [FEATURE_TEMPLATE.md](specs/templates/FEATURE_TEMPLATE.md) | New features, user-facing behavior, API contracts | `specs/features/` |
| [ARCHITECTURE_TEMPLATE.md](specs/templates/ARCHITECTURE_TEMPLATE.md) | Technology choices, structural decisions, design patterns | `specs/architecture/` |

## Workflow Steps

### 1. Specify

Choose the appropriate template and create a new spec:

- **Features** → Copy `specs/templates/FEATURE_TEMPLATE.md` to `specs/features/<TICKET-ID>-<feature-name>.md` (e.g., `ENG-123-dark-mode.md`). Fill in the Linear ticket URL and ID in the frontmatter.
- **Architecture** → Copy `specs/templates/ARCHITECTURE_TEMPLATE.md` to `specs/architecture/<decision-name>.md`

Fill in each section. Focus on clarity and completeness. Good specs answer:

- **What** is being built or decided?
- **Why** is it needed?
- **What** are the acceptance criteria and edge cases?

### 2. Review

Before writing code:

- Validate that requirements are testable and unambiguous.
- Ensure edge cases and out-of-scope items are explicit.
- Resolve open questions or mark them as blockers.
- Update the spec **Status** to reflect its readiness (e.g., Draft → In Review → Approved).

### 3. Implement

Write code in `src/` that fulfills the spec. The spec is your checklist:

- Each requirement should map to implementation.
- Edge cases should have corresponding tests or handling.
- If you discover gaps, update the spec rather than making undocumented decisions.

### 4. Verify

Confirm the implementation matches the spec:

- Run tests and manual checks against the requirements.
- Update the spec **Status** to `Implemented` when done.
- If requirements evolved during implementation, update the spec to reflect the final behavior.

## Spec Quality Guidelines

### Feature Specs

- **Summary** — One or two sentences. Someone should understand the feature without reading further.
- **Motivation** — Connects the feature to a real need. Helps future readers understand why it exists.
- **Requirements** — Use bullet points with clear, testable criteria. Include success and failure behavior.
- **Edge Cases** — List scenarios that could cause confusion or bugs. Don’t leave them implicit.
- **Out of Scope** — Explicitly exclude related work. Prevents scope creep and clarifies boundaries.
- **Open Questions** — Capture unresolved decisions. Resolve before implementation or mark as deferred.

### Architecture Specs

- **Context** — Describe the problem or situation. Future readers need to understand the forces at play.
- **Decision** — State the decision clearly. Avoid vague language.
- **Consequences** — Be honest about trade-offs. Document both benefits and costs.
- **Alternatives** — Show that options were considered. Explain why they were rejected.

## File Naming

- **Features**: `kebab-case.md` (e.g., `user-authentication.md`, `password-reset.md`)
- **Architecture**: `kebab-case.md` or `ADR-001-decision-name.md` if you use numbered ADRs

---

## Linear Integration

### Linking Specs to Linear Tickets

- Create a Linear ticket for the feature before or when creating the spec.
- Add the Linear ticket URL to the spec frontmatter (see [FEATURE_TEMPLATE.md](specs/templates/FEATURE_TEMPLATE.md)).
- Link the spec from the Linear ticket description or comments for bidirectional traceability.

### Naming Convention

Specs should include the Linear ticket ID in the filename:

```
specs/features/ENG-123-dark-mode.md
specs/features/ENG-456-password-reset.md
```

Format: `{TICKET-ID}-{feature-slug}.md`. This makes it easy to find the spec from the ticket and vice versa.

### Commit Message Format

Include the Linear ticket ID so commits link to the ticket:

```
ENG-123 Add dark mode toggle component

Implements registration flow per spec.
```

Format: `{TICKET-ID} Short description`. Linear will auto-link commits that reference ticket IDs.

---

## Code Review Process

### Spec Review Before Implementation

Spec review happens **before** any implementation code is written:

1. Author creates the spec and opens a PR (or shares for review).
2. Reviewer validates the spec against the guidelines: requirements are testable, edge cases are covered, out-of-scope is clear.
3. Author addresses feedback and updates the spec.
4. Once the spec is **Approved**, implementation may begin.

### Code Review Checklist

When reviewing implementation PRs, use the spec as the source of truth:

- [ ] **Spec alignment** — Does the implementation fulfill every requirement in the spec?
- [ ] **Acceptance criteria** — Can each requirement be verified (manually or via tests)?
- [ ] **Edge cases** — Are the edge cases from the spec handled?
- [ ] **Out of scope** — Does the PR avoid scope creep beyond the spec?
- [ ] **Tests** — Do tests cover the spec’s requirements and edge cases?

### Verifying Implementation Matches Spec

1. Open the spec alongside the PR.
2. Walk through each requirement and confirm it’s implemented.
3. Check that edge cases have corresponding handling or tests.
4. Flag any behavior that diverges from the spec — either the code or the spec needs to change.

### When Implementation Reveals Spec Gaps

If implementation uncovers missing requirements, ambiguities, or new edge cases:

1. **Update the spec first** — Add the new requirement, clarify the ambiguity, or document the edge case.
2. **Note the change** — Add a brief note (e.g., in a "Spec Amendments" section or commit message) explaining what was discovered.
3. **Proceed with implementation** — Implement the updated spec. Do not ship behavior that isn’t documented.

---

## Debugging & Iteration

### Update the Spec First When Bugs Reveal Gaps

When a bug indicates the spec was incomplete or wrong:

1. **Update the spec** — Add the missing edge case, correct the requirement, or clarify the intended behavior.
2. **Fix the code** — Implement the fix according to the updated spec.
3. **Add tests** — Ensure the bug is covered by tests so it doesn’t regress.

### Handling Edge Cases Discovered During Development

- **In-scope edge case** — Add it to the spec’s Edge Cases section, then implement handling.
- **Out-of-scope edge case** — Add it to Out of Scope (or a "Known Limitations" section) so it’s explicit. Address in a future spec if needed.

### Spec Amendments vs New Specs

| Situation | Action |
|-----------|--------|
| Missing requirement, typo, or clarification within same feature | **Amend** the existing spec. Add a note about the change. |
| New feature or significant new behavior | **New spec** — Create a separate spec (and possibly a new Linear ticket). |
| Bug fix that doesn’t change intended behavior | No spec change needed — the spec was correct; the implementation was wrong. |
| Bug fix that reveals the spec was wrong | **Amend** the spec to reflect the correct behavior. |

### Using the /debug Command

Run `/debug [bug description]` for systematic bug investigation: bug report, Linear ticket, investigation, BUG-REGISTRY updates, and constitution recommendations. See [GETTING-STARTED.md](GETTING-STARTED.md) for full details.

### Using Claude Code for Debugging with Spec Context

When debugging with Claude Code (or similar AI tools):

1. **Point to the spec** — Reference the spec file: `@specs/features/ENG-123-feature-name.md`
2. **Provide context** — Share the spec so the model understands intended behavior.
3. **Describe the bug** — Explain what’s happening vs what the spec says should happen.
4. **Update spec if needed** — If the debugging session reveals a spec gap, update the spec and note it in the fix.

---

## Work in Progress

### Pausing Work on a Feature

When you need to pause mid-feature:

1. **Update spec status** — Set Status to `In Progress` to indicate active work.
2. **Commit your work** — Push your branch so it’s not lost.
3. **Note blockers** — Add a comment in the spec or Linear ticket about what’s blocking and what’s left.

### Marking Specs as "In Progress"

Use the Status field:

- **Draft** — Spec is being written or reviewed.
- **In Review** — Spec is with reviewers.
- **Approved** — Spec is ready; implementation may start.
- **In Progress** — Implementation has started but is not complete.
- **Implemented** — Feature is complete and verified.

### Git Branch Naming

Branches should reference the spec and Linear ticket:

```
eng-123-dark-mode
ENG-123/add-dark-mode
feature/ENG-123-dark-mode
```

Pick a convention and stick to it. Format: `{ticket-id}-{short-description}` or `{ticket-id}/{description}`.

### Resuming Work

When returning to a paused feature:

1. **Checkout the branch** — `git checkout eng-123-dark-mode` (or your branch name).
2. **Open the spec** — Read `specs/features/ENG-123-dark-mode.md` to recall requirements and status.
3. **Point Claude Code to the spec** — When asking for help, reference the spec: *"Continue implementing @specs/features/ENG-123-dark-mode.md on branch eng-123-dark-mode. Here’s where we left off: …"*
4. **Resume implementation** — Use the spec as the checklist for remaining work.

---

## Quick Reference

```
specs/
├── templates/
│   ├── FEATURE_TEMPLATE.md      # Copy for new features
│   └── ARCHITECTURE_TEMPLATE.md # Copy for new ADRs
├── features/                    # Feature specifications
└── architecture/                # Architecture decision records
```

See the [README](README.md) for project structure and high-level workflow.
