---
name: readme
description: Explains what is SpecGantry.
author: Mangesh Pise <mppise@gmail.com>
license: Apache-2.0
---

# SpecGantry — Spec-Driven Development for Claude Code

SpecGantry is a comprehensive framework designed to transform the way you build software using AI agents like Claude Code. It shifts the focus from simple "prompt-and-code" cycles to a disciplined, **Spec-Driven Development (SDD)** approach, ensuring architectural integrity, traceability, and high quality across the entire software development lifecycle (SDLC).

## 🚀 Why SpecGantry?

When building complex applications with AI, it's easy to lose track of architectural decisions, introduce regressions, or drift from the original requirements. SpecGantry solves this by introducing a **governed lifecycle** where every piece of code is backed by a specification, and every phase is gated by a review.

By using SpecGantry, you transition from being just a "prompter" to a **Software Architect and Project Manager**, while the AI agent acts as your highly capable **Implementation Partner and Governor**.

## 🛠️ The Framework Architecture

SpecGantry organizes development into five distinct, gated phases:

1.  **Ideation**: Brainstorming and validating the core project idea. Result: `A_Project.md`.
2.  **Planning**: Defining the high-level architecture, assumptions, decisions, and risks. Result: `B_Architecture.md`, `C_Assumption.md`, `D_Decisions.md`, `E_Risks.md`.
3.  **Detailed Design**: Creating granular specifications for individual functional components. Result: Component-specific specs in `./SPECS/components/`.
4.  **Development**: Implementing features against the detailed design, maintaining technical documentation, and ensuring clean builds. Result: Production-ready source code in `./src/`.
5.  **Deployment Readiness**: A rigorous final audit of code, specs, and risks to ensure a successful release. Result: Deployment scripts and a readiness report in `./deploy/`.

## 🧩 Core Concepts

-   **Components & Features**: SpecGantry breaks applications down into high-level **Components** (capabilities), which are further decomposed into **Features** (functions).
-   **The Governor Role**: The AI agent doesn't just write code; it manages the project state, tracks pending reviews in specs, and prevents the project from moving to the next phase until all gates are passed.
-   **Agile Integration**: While the framework is spec-driven, it fully supports Agile methodologies. **User Stories** provide the "Why," and **Epics** organize work into Sprints, both of which map directly onto the Components and Features.
-   **Artifact Mapping**: Every line of code is mapped back to a specification, creating a transparent audit trail from the initial idea to the final deployment.

## 📖 How to Use SpecGantry

SpecGantry is designed to be invoked via specialized skills within Claude Code. Depending on your current phase, you can use:

-   `/ideate`: Move from a raw idea to a validated project spec.
-   `/plan`: Architect the system and document critical trade-offs.
-   `/design`: Create detailed implementation blueprints for components.
-   `/develop`: Turn designs into clean, tested code.
-   `/deployment-readiness`: Audit the release and prepare for launch.
-   `/brainstorm`: Resolve complex technical hurdles or trade-offs.
-   `/explain-code`: Get a clear understanding of the implemented logic.

## ⚖️ The Engagement Contract

To maintain the rigor of Spec-Driven Development, SpecGantry operates under a strict contract:
-   **Gated Progress**: No phase starts without explicit permission.
-   **Ownership**: Clear boundaries between the User (Architect/Lead) and the Agent (Governor/Developer).
-   **Artifact Integrity**: Strict rules on who can edit specific specifications to prevent "shadow changes" and maintain a single source of truth.

---
*SpecGantry empowers developers to build larger, more complex systems with AI by replacing guesswork with specifications.*
