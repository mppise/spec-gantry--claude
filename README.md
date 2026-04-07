---
name: readme
description: Explains what is SpecGantry.
author: Mangesh Pise <mppise@gmail.com>
license: Apache-2.0
---

# SpecGantry — Spec-Driven Development on Claude Code

SpecGantry is a structured harness built on top of [Claude Code](https://claude.ai/code) that enforces **Spec-Driven Development (SDD)** — a methodology where requirements and architecture are fully specified and reviewed before any code is written. It wraps the entire software lifecycle, from raw idea to live production, in a gated workflow with AI-assisted tooling at every phase.

Built for **development leads and architects** who want control, traceability, and consistency across projects — without sacrificing the speed of AI-assisted development.

---

## What Is Spec-Driven Development?

Spec-Driven Development is the practice of treating specifications as first-class artifacts:

1. **Specify** what you are building and why (`A_Project.md`)
2. **Architect** how it will be built, with all decisions made explicit (`B_Architecture.md`)
3. **Design** the detailed specifications for each component (`./components/`)
4. **Build** only against that locked specification (`./src/`)
5. **Ship** only after a structured release readiness review (`./.artifacts/rel_*/`)

Every assumption is documented. Every decision is traceable. Every risk is logged. Code is never written until the spec is validated and approved by the team lead.

---

## Core Concepts

### The Two Roles

| Role | Who | Responsibilities |
| :-- | :-- | :-- |
| **DevLead** | You | Owns requirements, approves architecture, confirms assumptions/decisions/risks, gates each phase |
| **SpecGantry** | Claude Code | Asks targeted questions, produces and maintains artifacts, implements code, surfaces risks and decisions |

SpecGantry never auto-approves its own outputs. Everything it produces gets reviewed and confirmed by DevLead before becoming a source of truth.

### The Artifact System

All project knowledge lives in `./.artifacts/` — the **single source of truth** for the entire lifecycle.

| File | Author | Reviewer | Purpose |
| :-- | :-- | :-- | :-- |
| `A_Project.md` | DevLead | SpecGantry | What you're building: requirements, target user, core features, success criteria |
| `B_Architecture.md` | SpecGantry | DevLead | How it's built: components, tech stack, data, APIs, security, deployment, testing |
| `C_Assumptions.md` | SpecGantry | DevLead | Every assumption made during the engagement |
| `D_Decisions.md` | SpecGantry | DevLead | Every key design decision |
| `E_Risks.md` | SpecGantry | DevLead | Every identified project risk |

Assumptions, decisions, and risks use checkbox notation so DevLead can interact with them directly:

- `[ ]` — Pending DevLead review
- `[X]` — Confirmed / Approved
- `[-]` — Rejected

### The Phase Gates

Nothing advances without a completed gate. SpecGantry enforces this at the start and end of every phase — no code without a signed-off architecture, no deployment without a clean release readiness review.

---

## Project Lifecycle

```
Raw Idea
   │
   ▼
┌─────────────────────────────────────────────────┐
│  IDEATION     /ideate                           │
│  A_Project.md validated and complete            │
└──────────────────────── GATE: DevLead confirms ─┘
   │
   ▼
┌─────────────────────────────────────────────────┐
│  PLANNING     /plan  /brainstorm                │
│  B_Architecture.md + C/D/E artifacts defined    │
└──────────────────────── GATE: DevLead confirms ─┘
   │
   ▼
┌─────────────────────────────────────────────────┐
│  DETAILED DESIGN /design                        │
│  Component-level specs defined in ./components/ │
└────────────────────────── GATE: Specs approved ─┘
   │
   ▼
┌─────────────────────────────────────────────────┐
│  DEVELOPMENT  /develop  /brainstorm             │
│  ./src/ implemented, artifacts kept current     │
└──────────────────── GATE: Features implemented ─┘
   │
   ▼
┌─────────────────────────────────────────────────┐
│  READINESS    /deployment-readiness             │
│  Release package: changelog, code review,       │
│  tech debt, smoke tests, rollback, comms        │
└───────── GATE: Zero blockers, DevLead approves ─┘
   │
   ▼
┌─────────────────────────────────────────────────┐
│  DEPLOYMENT   ./deploy/go.sh (manual)           │
│  Smoke tests verified against production        │
└─────────────────────────────────────────────────┘
   │
   ▼
MAINTENANCE   /ideate  /brainstorm  /explain-code
(New features restart from Ideation)
```

---

## Phase Reference

### Ideation 
> `/ideate`

**Purpose:** Turn a rough idea into a complete, unambiguous project specification.

SpecGantry reads `A_Project.md` and asks targeted questions until every section is specific enough to act on. It challenges completeness, feasibility, clarity, and consistency — and refuses to move forward until the answers are.

**You do:** Fill in `A_Project.md` with your idea. Answer SpecGantry's questions. 

**SpecGantry does:** Identify gaps, insert `<!-- comment -->` prompts in the file, validate your answers. 

**Gate:** DevLead confirms `A_Project.md` is complete and unambiguous.

---

### Planning 
> `/plan` + `/brainstorm`

**Purpose:** Translate `A_Project.md` into a complete technical architecture with all decisions, assumptions, and risks captured.

SpecGantry works through architecture topics one at a time — from tech stack and components through security, compliance, deployment, and testing strategy. It populates `B_Architecture.md` and surfaces items into `C_Assumptions.md`, `D_Decisions.md`, and `E_Risks.md` as it goes. Use `/brainstorm` when a decision has significant trade-offs.

**Topics covered:** Tech Stack · Components / Modules · Data · APIs / Interfaces · AI Integration · User Experience · Observability · Security · Compliance & Privacy · Third-Party Integrations · Scalability · Error Handling & Resilience · Notifications & Messaging · Deployment · Testing Strategy

After all topics are defined, SpecGantry stress-tests the architecture across four dimensions: consistency, completeness, risk, and simplicity.

**You do:** Answer questions, confirm/reject items in `C_Assumptions.md`, `D_Decisions.md`, `E_Risks.md`.  

**SpecGantry does:** Write `B_Architecture.md`, surface every assumption, decision, and risk it encounters.  

**Gate:** All architecture sections fully defined. DevLead reviews and acts on all checkboxes.

---

### Detailed Design
> `/design`

**Purpose:** Create granular, component-level specifications before implementation.

SpecGantry creates a set of dedicated specification files (Purpose, Dependencies, Data, etc.) for each component identified in the architecture. This ensures that the development phase is a purely mechanical implementation of a validated design.

**You do:** Review component specifications, confirm technical details.

**SpecGantry does:** Produce specification documents in `./components/{{component_name}}/`.

**Gate:** All component specifications completed and approved.

---

### Development 
> `/develop` + `/brainstorm`

**Purpose:** Implement the software according to the architecture and detailed design specifications. No surprises — code follows spec.

**Source layout (example from B_Architecture.md):**

| Layer | Directory |
| :-- | :-- |
| Data | `./src/db` |
| APIs (ExpressJS) | `./src/api` |
| Configuration | `./src/config` |
| Credentials / Secrets | `./src/credentials` |
| Frontend | `./src/ui` |
| AI Integration | `./src/ai` |

**You do:** Review code, approve new artifact entries, unblock SpecGantry when questions arise.  

**SpecGantry does:** Implement components, keep artifacts current, surface anything that diverges from the spec. 

**Gate:** All planned features implemented and traceable to `B_Architecture.md`.

---

### Readiness to Deployment 
> `/deployment-readiness`

**Purpose:** Produce a structured release package and verify there are zero blockers before shipping.

SpecGantry runs seven sequential reviews. Each item is checked off only after the review is actually conducted. Any SEV-1 or SEV-2 finding blocks the release.

| Stage | Output | Blocks on failure? |
| :-- | :-- | :-- |
| Changelog | `changelog.md` | No |
| Code Review Gate | `code-review.md` (SEV-1/2/3) | Yes |
| Technical Debt Scan | `tech-debt.md` (SEV-1/2/3) | Yes |
| Smoke Test Plan | `smoke-tests.md` | Yes |
| Rollback Plan | `rollback-plan.md` | Yes |
| Communication Draft | `communication.md` | Yes |
| Deployment Scripts | `./deploy/go.sh` + `./deploy/config.json` | Produced only if no blockers |

All outputs land in `./.artifacts/rel_yyyy.mm.dd_hhmm/`.

**You do:** Resolve blockers flagged by SpecGantry, review the release package, approve deployment.  

**SpecGantry does:** Run all seven reviews, document findings, produce deploy scripts only when the path is clear.  

**Gate:** Zero blockers. DevLead approves the release package. Version History entry written to `STATUS.md`.

---

### Deployment

**Purpose:** Ship the release to production.

This is a manual act — not a skill. DevLead reviews `./deploy/config.json` to confirm the target environment and parameters, then runs `./deploy/go.sh`. Smoke tests are run against production to verify the release is healthy.

---

### Maintenance
> `/ideate` · `/brainstorm` · `/explain-code`

**Purpose:** Operate and evolve the live software.

There is no exit gate from Maintenance. For any new feature or meaningful change, restart from Ideation. For debugging, design decisions, or understanding existing code, use the skills below.


---

## Skills Reference

| Skill | Phase | What It Does |
| :-- | :-- | :-- |
| `/ideate` | Ideation | Validates and completes `A_Project.md` through targeted Q&A |
| `/plan` | Planning | Builds `B_Architecture.md` one topic at a time; surfaces assumptions, decisions, risks |
| `/brainstorm` | Any | Structured Lincoln-Douglas debate across three personas (Affirmative, Negative, Judge) to resolve trade-offs |
| `/design` | Detailed Design | Produces granular component specifications in `./components/` |
| `/develop` | Development | Implements features in `./src/` traceable to architecture; keeps artifacts current |
| `/deployment-readiness` | Pre-Deployment | Seven-stage release review; produces release package and deploy scripts |
| `/documentation` | Development+ | Generates Bootstrap-styled HTML user documentation for features in `<UX dir>/docs/` |
| `/explain-code` | Any | Step-by-step explanation of what a piece of code does and why |

---

## Getting Started

### Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed and authenticated
- Git repository initialized

### Start a New Project

1. **Clone or copy this framework** into your project directory.

2. **Populate `./.artifacts/A_Project.md`** with your project idea. Fill in what you know — SpecGantry will surface the gaps.

3. **Start Claude Code** in the project directory:
   ```
   claude
   ```
   Or open in an Integrated Development Environment (IDE).

4. **Invoke the ideation skill:**
   ```
   /ideate
   ```

5. **Follow the gated lifecycle** — SpecGantry will guide you through each phase and tell you when a gate is ready to pass.

### Resume an Existing Project

Claude Code reads `./STATUS.md` at session start to identify the active phase. SpecGantry will confirm the current state and ask for permission to proceed.

---

## Principles

**Spec before code.** Requirements and architecture are locked in and reviewed before a single line is written. Ambiguity is a bug caught in planning, not production.

**Nothing skips a gate.** Each phase has explicit entry and exit criteria enforced by its skill. There is no shortcut from idea to deployment.

**Human in the loop.** SpecGantry surfaces assumptions, decisions, and risks — DevLead confirms, rejects, or acts on them. SpecGantry never auto-approves its own outputs.

**Artifacts are living documents.** Updated at every phase transition, reviewed continuously, and treated as the single source of truth across the entire lifecycle.

**Traceable decisions.** Every design decision, assumption, and risk is documented. Code is traceable back to architecture. Architecture is traceable back to requirements.

**No external calls without permission.** SpecGantry does not call external services or APIs without explicit approval.

---

## License

Apache-2.0 — see [LICENSE](LICENSE).
