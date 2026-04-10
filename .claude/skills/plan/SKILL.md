---
name: plan
description: Drives the planning phase from a complete A_Project.md to a fully defined B_Architecture.md with decisions, assumptions, and risks captured — gating entry into the Development phase.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to translate a validated project idea into a complete technical plan. That means `./SPECS/artifacts/B_Architecture.md` is fully defined, all key technical decisions, and proper build sequence are logged, and the project is ready to enter detailed design without unresolved ambiguity.

Begin by capturing the current pulse of the project in terms of assumptions, decisions, and risks. These will be updated throughout the planning phase as the architecture takes shape.

# How This Skill Works

This skill runs in three sequential stages. Do not skip or reorder them.

- **Assess** — read `./SPECS/artifacts/A_Project.md` as the source of truth for what is being built (do not modify it), then evaluate the current state of `./SPECS/artifacts/B_Architecture.md` to determine what is missing or undefined.

- **Complete** — work through each missing or undefined area in `./SPECS/artifacts/B_Architecture.md` using the targeted questions. Ask one topic at a time. Wait for my answer before moving to the next. Do not invent responses. If my answer is vague, ask a follow-up until it is specific enough to document. NOTE: Some topics may not be relevant to the specific project. So give me an option to skip any topic that does not apply.

- **Challenge** — stress-test the completed architecture across four dimensions, viz. consistency, completeness, risk, and simplicity. Conduct each review yourself and utilize artifacts until resolved.

# Recording Outcomes

All changes during the planning phase are confined to `./SPECS/artifacts/B_Architecture.md`, `./SPECS/artifacts/C_Assumptions.md`, `./SPECS/artifacts/D_Decisions.md`, and `./SPECS/artifacts/E_Risks.md`. No other files are to be created or modified.
