---
name: ideate
description: Drives the ideation phase from raw idea to a complete, feasibility-validated A_Project.md with seeded artifacts — gating entry into the Planning phase.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to take a project idea — however raw or complete — and drive it to a state where Planning can begin with confidence. That means `./SPECS/artifacts/A_Project.md` is fully populated, feasibility has been assessed, and known unknowns are captured in the artifact system. The ideation phase is all about fleshing out the concept, identifying potential challenges, and ensuring that we have a solid foundation to build upon in the subsequent phases of the project lifecycle.

# How This Skill Works

This skill runs in four sequential stages. Do not skip or reorder them.

- **Assess** — evaluate the current state of `./SPECS/artifacts/A_Project.md` and identify any gaps or areas that need further clarification. Focus on the idea itself and not on the implementation details. This is a critical step to ensure we have a clear understanding of the project idea before moving forward. 

- **Complete** — fill gaps through targeted questions. Work through each incomplete or missing information in `./SPECS/artifacts/A_Project.md` using the targeted questions. Wait for my answer before moving to the next. Do not invent answers. If I give a vague response, ask a follow-up until the answer is specific enough to write down.

- **Challenge** — stress-test the content across four dimensions, viz. requirement completeness, feasibility, clarity, and consistency. For each, conduct the review yourself and ask a follow-up until the answer is specific enough to write down.

# Recording Outcomes

All changes during the planning phase are confined to `./SPECS/artifacts/A_Project.md` and potentially `./SPECS/artifacts/C_Assumptions.md`. No other files are to be created or modified.