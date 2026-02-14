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

- **Features** → Copy `specs/templates/FEATURE_TEMPLATE.md` to `specs/features/<feature-name>.md`
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
