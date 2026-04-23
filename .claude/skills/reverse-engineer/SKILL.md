---
name: reverse-engineer
description: Use this skill to reverse engineer an existing codebase or system and generate artifacts and component specifications that fit within the structure of a SpecGantry initiated project.
user-invocable: true
author: Mangesh Pise <mppise@gmail.com>
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

As this skill is invoked, understand that the project is either already built or partially complete. The goal is to analyze the existing codebase or system and reverse engineer it to extract the necessary information to fill in the architecture and related artifacts in a way that aligns with the SpecGantry structure. That means, you will conduct a discovery from the available code and documentation to populate SpecGantry artifacts.

Begin by capturing the current pulse of the project in terms of project idea, architecture, assumptions, decisions, and risks. These will be updated throughout the phase as more information is learnt throughout the discovery.

NOTE: This skill will not involve writing any new code or modifying existing code in the actual source code. The focus is solely on understanding and documenting the existing system within the SpecGantry framework.

# How This Skill Works

This entire process runs on auto-pilot without any user interaction or inputs, simply because the user may not know the details of an already built system. 

This skill runs in three sequential stages. Do not skip or reorder them.

- **Discover** — deep-dive into available codebase and documentation to understand the project idea and update `./SPECS/artifacts/A_Project.md`. Then update the `./SPECS/artifacts/B_Architecture.md` to document the discovered architecture. During the process, identify any assumptions, decisions, and risks that are not yet documented and update `./SPECS/artifacts/C_Assumptions.md`, `./SPECS/artifacts/D_Decisions.md`, and `./SPECS/artifacts/E_Risks.md` respectively. This stage should closely align with the __Ideate__ and __Plan__ phases of the SpecGantry process.

- **Design** — translate the discovered information into a detailed design that fits within the SpecGantry structure. This includes defining components, their interactions, and how they fit into the overall architecture. Update the `./SPECS/components/{{ functional_component_name }}` specifications in alignment with how the current system is designed, i.e. identify functional components, modules, interfaces, etc. from the discovered information. This stage should closely align with the __Design__ phase of the SpecGantry process.

- **Challenge** — stress-test the completed architecture across four dimensions, viz. consistency, completeness, risk, and simplicity. Conduct each review yourself and utilize artifacts until resolved. You are permitted to ONLY RECOMMEND improvements and not actually implement them. 

# Recording Outcomes

All changes are confined to `./SPECS/artifacts/B_Architecture.md`, `./SPECS/artifacts/C_Assumptions.md`, `./SPECS/artifacts/D_Decisions.md`, `./SPECS/artifacts/E_Risks.md`, and `./SPECS/components/{{ functional_component_name }}`. No other files in the actual source code are to be created or modified.

Generate a well-structured report to document recommendations in architecture and design improvements in a `./SPECS/reverse-engineering/{{ yyyy.mm.dd_hh:mm }}.md` file.

## Numbering System for Artifacts

Use the following 10-character nomenclature to generate unique IDs in each of the artifacts:
  ```
  ^[ADR]-[a-zA-Z0-9]{8}$
  ```
  i.e. To reach exactly 10 characters, we break it down like this:
  - Prefix (2 chars): [ADR]- (The letter + the hyphen).
  - Suffix (8 chars): [a-zA-Z0-9]{8} (Any combination of alphanumeric characters).
