---
name: readme
description: Explains what is SpecGantry.
author: Mangesh Pise <mppise@gmail.com>
license: Apache-2.0
---

# SpecGantry — Spec-Driven Development for Claude Code

SpecGantry is a project lifecycle governance framework built on top of [Claude Code](https://claude.ai/code). It brings the discipline of spec-driven development to AI-assisted software engineering — ensuring that every line of code is traceable to a design, every design is traceable to architecture, and every architecture decision is grounded in a validated project idea.

---

## Why SpecGantry?

Most AI coding tools jump straight to code generation. SpecGantry doesn't.

It treats Claude Code not as an autocomplete engine, but as a **collaborative engineering partner** that actively governs an entire project lifecycle — from raw idea to production-ready release. The framework enforces a structured sequence of phases, each gated by review and approval, so the team never moves forward on an ambiguous or incomplete foundation.

**Key benefits:**

- **No phantom features** — every feature is specified before it is coded, and every specification is reviewed before design begins.
- **Full traceability** — code links back to component specs, specs link back to architecture, architecture links back to project goals.
- **Built-in governance** — assumptions, decisions, and risks are tracked in dedicated artifacts throughout the lifecycle. Open items block progress until resolved.
- **Repeatable process** — the same structured workflow applies to greenfield projects, new releases, and maintenance cycles, so any stakeholder can pick up the project state at any point.
- **Deployment confidence** — a dedicated Deployment Readiness phase produces a full release package (changelog, code review gate, tech debt scan, smoke test plan, rollback plan, and release communication) before any deployment is attempted.

---

## The Bigger Picture

SpecGantry organizes the collaboration between a **DevLead** (you) and **SpecGantry** (Claude Code) across five ordered phases. Each phase has:

- A defined **objective** — what must be true before the phase is done.
- **Artifacts** — specific files that are created, updated, or reviewed in that phase.
- **Skills** — slash commands that drive Claude Code's behavior within that phase.
- A **gate** — an explicit handoff point that requires DevLead review and approval before the next phase begins.

The project's ground truth lives in the `./SPECS/` directory. Source code lives in `./src/`. Deployment artifacts live in `./deploy/`. The `./STATUS.md` file is the single pane of glass for project health at any moment.

```
SpecGantry-Claude/
├── CLAUDE.md                     # Roles, engagement contract, and lifecycle rules
├── STATUS.md                     # Live project/component status tracker + version history
├── SPECS/
│   ├── artifacts/
│   │   ├── A_Project.md          # Project idea, features, success criteria
│   │   ├── B_Architecture.md     # Technical architecture, tech stack, components
│   │   ├── C_Assumptions.md      # All assumptions with review status
│   │   ├── D_Decisions.md        # All decisions with review status
│   │   └── E_Risks.md            # All risks with review status
│   └── components/
│       └── <ComponentName>/      # One sub-directory per functional component
│           ├── A_Purpose.md      # Features table with build status
│           ├── B_Dependencies.md
│           ├── C_Data.md
│           ├── D_ExecutionMode.md
│           ├── E_ExternalServices.md
│           ├── F_ExposedServices.md
│           ├── G_AICapabilities.md
│           ├── H_Events.md
│           └── I_NFR.md
├── src/                          # All application source code
├── deploy/
│   └── rel_YYYY.MM.DD_HH:MM/    # Release readiness package per deployment attempt
└── .claude/
    └── skills/                   # Skill definitions for each lifecycle phase
```

---

## Lifecycle Phases

```
        ┌─────────────────────────────┐
        │         Ideation            │
        │  /ideate  /brainstorm       │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: A_Project.md complete
               + feasibility validated
                       │
        ┌──────────────▼──────────────┐
        │          Planning           │
        │  /plan  /brainstorm         │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: B_Architecture.md complete
               + all decisions/assumptions/risks resolved
                       │
        ┌──────────────▼──────────────┐
        │       Detailed Design       │
        │  /design  /brainstorm       │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: all component specs complete
               + no open review items
                       │
        ┌──────────────▼──────────────┐
        │         Development         │
        │  /develop  /explain-code    │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: all features built and marked [X]
               + user docs generated
                       │
        ┌──────────────▼──────────────┐
        │     Deployment Readiness    │
        │  /deployment-readiness      │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: no SEV-1/SEV-2 blockers
               + release package complete
                       │
        ┌──────────────▼──────────────┐
        │          Deploy             │
        │  (DevLead runs deploy/go.sh)│
        └──────────────┬──────────────┘
                       │
                       ▼
               Maintenance
            (new git branch →
             repeat full cycle)
```

---

### Phase 1 — Ideation

**Goal:** Convert a raw project idea into a complete, feasibility-validated `A_Project.md` that can support the planning phase.

**What happens:**
1. DevLead shares a project idea (however rough).
2. SpecGantry assesses `A_Project.md` for gaps, then asks targeted questions to fill each section: project name, problem statement, solution approach, target user, core features, success criteria, and out-of-scope items.
3. SpecGantry stress-tests the completed document across four dimensions: **requirement completeness**, **feasibility**, **clarity**, and **consistency**. Follow-up questions are asked until every dimension is resolved.
4. `STATUS.md` is updated to mark Ideation complete.

**Skills:** `/ideate`, `/brainstorm`  
**Primary artifact:** `./SPECS/artifacts/A_Project.md`

---

### Phase 2 — Planning

**Goal:** Translate the validated project idea into a complete technical architecture documented in `B_Architecture.md`, with all open decisions, assumptions, and risks logged.

**What happens:**
1. SpecGantry reads `A_Project.md` as the source of truth (never modified in this phase).
2. SpecGantry interviews DevLead across **15 architecture topics**, one at a time: Tech Stack, Components/Modules, Data, APIs/Interfaces, AI Integration (including MCP server design), User Experience (mobile-first, cloud-first, AI-first), Observability & Analytics, Security, Compliance & Privacy, Third-party Integrations, Scalability, Error Handling & Resilience, Notifications & Messaging, Deployment, and Testing Strategy.
3. Any assumption, decision, or risk surfaces immediately into `C_Assumptions.md`, `D_Decisions.md`, or `E_Risks.md`. Items marked `[ ]` (pending review) block forward progress.
4. Architecture is stress-tested across: **consistency**, **completeness**, **risk**, and **simplicity**.
5. `STATUS.md` is updated to mark Planning complete.

**Skills:** `/plan`, `/brainstorm`  
**Primary artifact:** `./SPECS/artifacts/B_Architecture.md`

---

### Phase 3 — Detailed Design

**Goal:** Produce a full specification package for each functional component identified during architecture planning.

**What happens:**
1. For each component, SpecGantry runs `/design <ComponentName>` to produce **9 specification documents** under `./SPECS/components/<ComponentName>/`:

   | File | Contents |
   | :-- | :-- |
   | `A_Purpose.md` | Feature table with must-have/nice-to-have priority and build status |
   | `B_Dependencies.md` | Internal and external dependencies |
   | `C_Data.md` | Data elements consumed, produced, and transformed |
   | `D_ExecutionMode.md` | Online vs. background process behavior |
   | `E_ExternalServices.md` | External APIs and interfaces consumed |
   | `F_ExposedServices.md` | Services and APIs this component exposes |
   | `G_AICapabilities.md` | AI capabilities, models, and prompt strategy |
   | `H_Events.md` | Events consumed and produced |
   | `I_NFR.md` | Performance, security, accessibility, and other non-functional requirements |

2. Any new assumptions, decisions, or risks surfaced during design are immediately logged. Open items block progress until reviewed.
3. `STATUS.md` Component Status Tracker is updated after each component.
4. Only once **all components are designed** does SpecGantry signal readiness for Development.

**Skills:** `/design <ComponentName>`, `/brainstorm`  
**Primary artifacts:** `./SPECS/components/<ComponentName>/`

---

### Phase 4 — Development

**Goal:** Implement all features for a given component, keeping code traceable to specs, well-documented, and paired with user-facing documentation.

**What happens:**
1. SpecGantry reads all component specifications and implements features in the order defined in `A_Purpose.md`.
2. As each feature is completed, its row in `A_Purpose.md` is marked `[X]`.
3. For each feature, the `documentation` skill generates an HTML user documentation page (Bootstrap-styled) stored in the UX docs directory.
4. New assumptions, decisions, or risks discovered during coding are logged immediately. If an impacting design gap is found, development **stops** until DevLead resolves it.
5. `STATUS.md` Component Status Tracker is updated when the component is fully complete (all features done).
6. When all components are complete, the Development phase is marked complete — but deployment requires the Deployment Readiness phase to pass first.

**Skills:** `/develop <ComponentName>`, `/explain-code`  
**Primary artifacts:** `./src/`, `./SPECS/components/<ComponentName>/A_Purpose.md`

---

### Phase 5 — Deployment Readiness

**Goal:** Produce a complete release readiness package and gate entry into actual deployment.

**What happens (7 sequential stages, none skippable):**

1. **Components Included** (`components.md`) — table of what is in scope for this release vs. deferred.
2. **Changelog** (`changelog.md`) — all changes organized by Features and Fixes.
3. **Code Review Gate** (`code-review.md`) — syntax, architecture alignment, security, maintainability, cross-component side-effects; issues categorized SEV-1/2/3.
4. **Technical Debt Scan** (`tech-debt.md`) — 7 debt categories: Code Quality, Test Coverage, Architecture, Documentation, Dependencies, Operational, Security; issues categorized SEV-1/2/3.
5. **Smoke Test Plan** (`smoke-tests.md`) — top user-critical flows and system health checks to run immediately after deploy. *(Skipped if blockers in stages 3–4.)*
6. **Rollback Plan** (`rollback-plan.md`) — rollback trigger, migration reversibility, time-to-rollback, notification chain. *(Skipped if blockers in stages 3–4.)*
7. **Release Communication** (`communication.md`) — stakeholder-ready release announcement. *(Skipped if blockers in stages 3–4.)*

All files land in `./deploy/rel_YYYY.MM.DD_HH:MM/`. If all checks pass, `STATUS.md` Version History is updated with the new release version marked `[X]` Active and ready to deploy.

**Skills:** `/deployment-readiness`  
**Primary artifacts:** `./deploy/rel_YYYY.MM.DD_HH:MM/`

---

### Maintenance

When a live release needs changes, SpecGantry enters Maintenance mode on a **new git branch** (name chosen by DevLead). The full five-phase cycle repeats on that branch with the same governance rigor. Live artifacts are treated as read-only until the new cycle formally changes them.

**Skills:** `/explain-code`

---

## Cross-Phase Skills

Two skills are available at any phase:

| Skill | When to use |
| :-- | :-- |
| `/brainstorm <issue>` | Any time a decision has no clear answer or involves significant trade-offs. Uses a structured Lincoln-Douglas debate format with Affirmative, Negative, and Judge personas to surface all angles before committing to an approach. |
| `/explain-code <snippet>` | Any time you need a plain-language explanation of a piece of code — useful during code review, onboarding, or design verification. |

---

## Getting Started

### Prerequisites

- [Claude Code](https://claude.ai/code) installed and authenticated.
- A git repository initialized at your project root.

### Setup

1. Clone or copy the SpecGantry framework into your project root. The critical files are:
   - `CLAUDE.md` — the engagement contract that governs the entire collaboration.
   - `STATUS.md` — the live project tracker.
   - `SPECS/artifacts/` — the five core artifact templates.
   - `.claude/skills/` — the skill definitions for each lifecycle phase.

2. Open Claude Code in your project directory.

3. Start the ideation phase:
   ```
   /ideate
   ```
   Describe your project idea. SpecGantry will guide you through completing `A_Project.md` and will not let you proceed to Planning until the idea is feasibility-validated.

4. Proceed through each phase in order, using the skills listed above. **Always ask permission before starting a new phase** — this is an explicit contract rule.

5. Track progress at any time by reading `STATUS.md`.

### Key Rules

- SpecGantry will **not** edit `A_Project.md` — that document is owned by DevLead.
- SpecGantry will **stop and ask** whenever an assumption, decision, or risk is unresolved.
- SpecGantry will **not** call external services or APIs without explicit permission.
- Deployment only happens after the Deployment Readiness phase produces a clean package.
- Maintenance always starts on a **new git branch**.

---

## Skills Reference

| Skill | Phase | Invocable | Description |
| :-- | :-- | :--: | :-- |
| `/ideate` | Ideation | Yes | Drives raw idea → complete, feasibility-validated `A_Project.md` |
| `/plan` | Planning | Yes | Drives `A_Project.md` → complete `B_Architecture.md` with all technical decisions |
| `/design <component>` | Detailed Design | Yes | Produces 9-document specification package for one component |
| `/develop <component>` | Development | Yes | Implements all features for one component with code + user docs |
| `/deployment-readiness` | Deployment Gate | Yes | Generates 7-stage release readiness package |
| `/brainstorm <issue>` | Any phase | Yes | Structured debate-format brainstorm for unresolved trade-offs |
| `/explain-code <snippet>` | Any phase | Yes | Plain-language explanation of a code snippet |
| `documentation` | Development | No | Auto-invoked by `/develop` to generate HTML feature documentation |

---

## License

Apache-2.0 — see [LICENSE](LICENSE) for details.
