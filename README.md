# my-app

## Spec-Driven Development

This project follows a spec-driven development workflow. Specifications are written **before** implementation, serving as the source of truth for what the software should do and how it should be structured.

## Project Structure

```
my-app/
├── specs/
│   ├── features/      # Feature specifications
│   └── architecture/  # Architecture decision records and system design
├── src/               # Implementation (driven by specs)
└── README.md
```

## Workflow

1. **Specify** — Write a spec in `specs/features/` or `specs/architecture/` describing the desired behavior or design decision.
2. **Review** — Validate the spec for completeness and clarity before writing any code.
3. **Implement** — Write code in `src/` that fulfills the spec.
4. **Verify** — Confirm the implementation matches the spec. Update the spec if requirements evolve.

## Specs Directory

### `specs/features/`

Contains feature specifications. Each file describes a single feature including its purpose, expected behavior, inputs/outputs, and edge cases.

### `specs/architecture/`

Contains architecture decision records (ADRs) and system design documents. These capture structural decisions such as technology choices, module boundaries, and data flow.

## Guidelines

- No code should be written without a corresponding spec.
- Specs are living documents — update them when requirements change.
- Keep specs concise and focused on **what** and **why**, not **how**.
