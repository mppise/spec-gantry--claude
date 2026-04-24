# SpecGantry — Spec-Driven Development for Claude Code

SpecGantry is a project lifecycle governance framework built on top of [Claude Code](https://claude.ai/code). It brings the discipline of spec-driven development to AI-assisted software engineering — ensuring that every line of code is traceable to a design, every design is traceable to architecture, and every architecture decision is grounded in a validated project idea.


---


# Getting Started

## Prerequisites
- [Claude Code](https://claude.ai/code) installed and authenticated.
   - **NOTE** : **Claude Code can be in ANY mode _EXCEPT_ `plan mode` to utilize SpecGantry.**

- Bash/Zsh environment (Linux, macOS, or WSL).

## Setup

> **Are you a developer looking to use SpecGantry in your project?** Follow the steps below to get started.  
> If you want to **contribute** to SpecGantry itself, please visit [CONTRIBUTING.md](CONTRIBUTING.md) instead.

1. To integrate Spec-Gantry into your project, run the following command in your **project's root directory**. This will download the latest version of the framework and configure the necessary permissions automatically.
   ```
   curl -sfL https://raw.githubusercontent.com/mppise/spec-gantry--claude/main/install.sh | bash
   ```
---

2. Open Claude Code in your project directory.
   ```
   claude
   ```

    **NOTE** : **Make sure Claude Code is NOT in `plan mode` to utilize SpecGantry.**
---

3. There are many ways to start a project:

   i. Start with as simple as a ` Hi ` or ` I want to build an application that ... `.

   ii. Alternatively, kick-off the ideation phase:
      ```
      /ideate
      ```
      Describe your project idea. 
   
   iii. Update `./SPECS/artifacts/A_Project.md` in part or full and engage with option (i) or (ii) above.

   iv. **Already have an existing codebase?** Reverse-engineer it into SpecGantry artifacts:
      ```
      /reverse-engineer
      ```
      SpecGantry will analyze the codebase and generate `A_Project.md`, `B_Architecture.md`, and component specifications — letting you adopt spec-driven governance on an existing project without starting from scratch.
---
   
4. SpecGantry will guide you through the lifecycle phases.
---

5. Track progress at any time by reading `STATUS.md` or by asking claude.


---


**Table of Contents**

- [**Why SpecGantry?**](#why-specgantry)

- [**The Bigger Picture**: The Governed Workflow](#the-bigger-picture-the-governed-workflow)

- [**Lifecycle Phases**](#lifecycle-phases)

  - [Phase 1 — Ideation](#phase-1--ideation)

  - [Phase 2 — Planning](#phase-2--planning)

  - [Phase 3 — Detailed Design](#phase-3--detailed-design)

  - [Phase 4 — Development](#phase-4--development)

  - [Phase 5 — Deployment Readiness](#phase-5--deployment-readiness)

  - [Maintenance](#maintenance)

  - [Reverse Engineering an Existing Project](#reverse-engineering-an-existing-project)

- [**Skills Reference**](#skills-reference)

- [**Disclaimer**](#disclaimer)

- [**License**](#license)


---


# Why SpecGantry?

Most AI coding tools jump straight to code generation. SpecGantry doesn't.

It treats Claude Code not as an autocomplete engine, but as a **collaborative engineering partner** that actively governs an entire project lifecycle — from raw idea to production-ready release. The framework enforces a structured sequence of phases, each gated by review and approval, so the team never moves forward on an ambiguous or incomplete foundation.

## Key benefits:

- **No phantom features** — every feature is specified before it is coded, and every specification is reviewed before design begins.
- **Full traceability** — code links back to component specs, specs link back to architecture, architecture links back to project goals.
- **Built-in governance** — assumptions, decisions, and risks are tracked in dedicated artifacts throughout the lifecycle. Open items block progress until resolved.
- **Repeatable process** — the same structured workflow applies to greenfield projects, new releases, and maintenance cycles, so any stakeholder can pick up the project state at any point.
- **Deployment confidence** — a dedicated Deployment Readiness phase produces a full release package (changelog, code review gate, tech debt scan, smoke test plan, rollback plan, and release communication) before any deployment is attempted.


---


# The Bigger Picture: The Governed Workflow

SpecGantry organizes the collaboration between a **DevLead** (you) and **SpecGantry** (this framework) across five ordered phases. This is not just a sequence of steps, but a **Governed Workflow** based on a **Draft -> Review -> Finalize** loop.

Each phase consists of:
- **A defined objective** — what must be true before the phase is done.
- **Artifacts** — specific files that are created, updated, or reviewed.
- **Skills** — slash commands that drive Claude Code's behavior.
- **Governance Triggers** — explicit rules (defined in `CLAUDE.md`) that prevent the AI from unilaterally marking tasks as "Complete" without DevLead approval.
- **A gate** — an explicit handoff point that requires DevLead review and approval before the next phase begins.

The project's ground truth lives in the `./SPECS/` directory. Source code lives in `./src/`. Deployment artifacts live in `./deploy/`. The `./STATUS.md` file is the single pane of glass for project health at any moment.


---


# Lifecycle Phases

```
        ┌─────────────────────────────┐
        │         Ideation            │
        │  /ideate  /brainstorm       │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: A_Project.md approved
               (Draft -> Review -> Finalize)
                       │
        ┌──────────────▼──────────────┐
        │          Planning           │
        │  /plan  /brainstorm         │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: B_Architecture.md approved
               (Draft -> Review -> Finalize)
                       │
        ┌──────────────▼──────────────┐
        │       Detailed Design       │
        │  /detailed-design /brainstorm│
        └──────────────┬──────────────┘
                       │
            ◈  GATE: All Specs approved
               (Draft -> Review -> Finalize)
                       │
        ┌──────────────▼──────────────┐
        │         Development         │
        │  /develop  /explain-code    │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: All Features verified
               (Evidence -> Review -> Finalize)
                       │
        ┌──────────────▼──────────────┐
        │     Deployment Readiness    │
        │  /deployment-readiness      │
        └──────────────┬──────────────┘
                       │
            ◈  GATE: No SEV-1/2 Blockers
               (Silent Audit -> Final Summary)
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


## Phase 1 — Ideation

**Goal:** Convert a raw project idea into a complete, feasibility-validated `A_Project.md` that can support the planning phase.

**Governed Workflow:** SpecGantry presents summaries of findings as drafts. The phase is only complete when the DevLead confirms the project idea is final.

**What happens:**
1. DevLead shares a project idea (however rough).
2. SpecGantry assesses `A_Project.md` for gaps, then asks targeted questions to fill each section.
3. SpecGantry stress-tests the completed document across: **requirement completeness**, **feasibility**, **clarity**, and **consistency**.
4. `STATUS.md` is updated only after DevLead's final confirmation.

**Skills:** `/ideate`, `/brainstorm`  
**Primary artifact:** `./SPECS/artifacts/A_Project.md`


## Phase 2 — Planning

**Goal:** Translate the validated project idea into a complete technical architecture documented in `B_Architecture.md`, with all open decisions, assumptions, and risks logged.

**Governed Workflow:** All architecture updates and artifacts (`C_Assumption`, `D_Decisions`, `E_Risks`) are presented as "Proposals for Review." 

**What happens:**
1. SpecGantry reads `A_Project.md` as the source of truth.
2. SpecGantry interviews DevLead across **15 architecture topics**, one at a time.
3. Any assumption, decision, or risk is logged. Items marked `[ ]` (pending review) are hard blockers.
4. Architecture is stress-tested across: **consistency**, **completeness**, **risk**, and **simplicity**.
5. `STATUS.md` is updated only after the DevLead explicitly types "Approved" or "Confirmed".

**Skills:** `/plan`, `/brainstorm`  
**Primary artifact:** `./SPECS/artifacts/B_Architecture.md`


## Phase 3 — Detailed Design

**Goal:** Produce a full specification package for each functional component identified during architecture planning.

**Governed Workflow:** Every component specification (`A_Core_Spec`, `B_Interfaces`, `C_Specialized_Specs`) is presented as a draft. SpecGantry must explicitly request approval before marking a component as "Reviewed" or "Complete".

**What happens:**
1. For each component, SpecGantry runs `/detailed-design <ComponentName>` to produce **up to 3 specification documents** under `./SPECS/components/<ComponentName>/`.
2. Any new assumptions, decisions, or risks are immediately logged. Open items `[ ]` block progress.
3. `STATUS.md` Component Status Tracker is updated after each component review.
4. Only once **all components are approved** does SpecGantry signal readiness for Development.

**Skills:** `/detailed-design <ComponentName>`, `/brainstorm`  
**Primary artifacts:** `./SPECS/components/<ComponentName>/`


## Phase 4 — Development

**Goal:** Implement all features for a given component, keeping code traceable to specs, well-documented, and paired with user-facing documentation.

**Governed Workflow:** A feature is only considered "Complete" when verification evidence (test logs, output, or a demo) is presented and acknowledged.

**What happens:**
1. SpecGantry reads all component specifications and implements features in the order defined in `A_Core_Spec.md`.
2. As each feature is completed, its Status is updated in `A_Core_Spec.md`. For trivial changes, an Implementation Note is added directly to the spec.
3. For each feature, the `documentation` skill generates an HTML user documentation page (Bootstrap-styled) which must be reviewed and marked "Approved".
4. New assumptions, decisions, or risks are logged immediately.
5. `STATUS.md` Component Status Tracker is updated when the component is fully complete.

**Skills:** `/develop <ComponentName>`, `/explain-code`  
**Primary artifacts:** `./src/`, `./SPECS/components/<ComponentName>/A_Core_Spec.md`


## Phase 5 — Deployment Readiness

**Goal:** Produce a complete release readiness package and gate entry into actual deployment.

**Governed Workflow:** **Audit Mode**. SpecGantry is strictly prohibited from asking for inputs or making "fixes". Findings are documented as "PASS/FAIL" based on evidence.

**What happens (7 sequential stages, none skippable):**
1. **Components Included** (`components.md`)
2. **Changelog** (`changelog.md`)
3. **Code Review Gate** (`code-review.md`) — SEV-1/2/3 categorization.
4. **Technical Debt Scan** (`tech-debt.md`) — 7 debt categories; SEV-1/2/3 categorization.
5. **Smoke Test Plan** (`smoke-tests.md`)
6. **Rollback Plan** (`rollback-plan.md`)
7. **Release Communication** (`communication.md`)

All files land in `./deploy/rel_yyyy.mm.dd.hhmm/`. If all checks pass, `STATUS.md` Version History is updated and the release is marked ready for deployment.

**Skills:** `/deployment-readiness`  
**Primary artifacts:** `./deploy/rel_yyyy.mm.dd.hhmm/`


## Maintenance

When a live release needs changes, SpecGantry enters Maintenance mode on a **new git branch**. The full five-phase cycle repeats on that branch with the same governance rigor. Live artifacts are treated as read-only until the new cycle formally changes them.

**Skills:** `/explain-code`


## Reverse Engineering an Existing Project

SpecGantry is not only for greenfield projects. If you have an existing codebase, `/reverse-engineer` analyzes it and generates the full artifact set — `A_Project.md`, `B_Architecture.md`, and component specifications under `./SPECS/components/` — so that the project can be brought under SpecGantry governance without manual documentation effort.

**Skills:** `/reverse-engineer`


---


# Skills Reference

## Invocable Skills

| Skill | Phase | Description |
| :--- | :--- | :-- |
| `/ideate` | Ideation | Drives raw idea -> complete, feasibility-validated `A_Project.md` |
| `/plan` | Planning | Drives `A_Project.md` -> complete `B_Architecture.md` with all technical decisions |
| `/detailed-design <component>` | Detailed Design | Produces up to 3 specification documents for one component |
| `/develop <component>` | Development | Implements all features for one component with code + user docs |
| `/deployment-readiness` | Deployment Gate | Generates 7-stage release readiness package |
| `/reverse-engineer` | Any | Reverse-engineers an existing codebase into SpecGantry artifacts and component specs |

## Non-invocable Skills

| Skill | Description |
| :--- | :-- |
| `/explain-code <snippet>` | Plain-language explanation of a code snippet |
| `/brainstorm <issue>` | Structured debate-format brainstorm for unresolved trade-offs |
| `/documentation` | Called by `/develop` to generate Bootstrap-styled HTML user documentation for each implemented feature |
| `/reverse-engineer` | Analyzes an existing codebase and generates SpecGantry artifacts (`A_Project.md`, `B_Architecture.md`, component specs) to bring the project under spec-driven governance |


---


# Disclaimer

SpecGantry is provided **"AS IS"**, without warranty of any kind, express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose, or non-infringement. In no event shall the author be liable for any claim, damages, or other liability arising from the use of this software.

This project is an **independent, community-developed framework** and is **not affiliated with, endorsed by, sponsored by, or officially supported by Anthropic, PBC** in any way. "Claude" and "Claude Code" are trademarks of Anthropic, PBC. Their use here is solely for descriptive purposes to identify the runtime environment with which SpecGantry is compatible.

SpecGantry does **NOT** contain, distribute, or derive from any Anthropic source code, SDK, or proprietary assets. The Claude Code runtime is a separate product governed by Anthropic's own terms of service and must be installed independently.

Users are solely responsible for reviewing any AI-generated output produced through use of this framework and for ensuring compliance with applicable laws, regulations, and Anthropic's usage policies.


---


# License

Apache-2.0 — Copyright 2026 Mangesh Pise. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for details.
