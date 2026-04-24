---
name: plan
description: Drives the planning phase from a complete A_Project.md to a fully defined B_Architecture.md with decisions, assumptions, and risks captured — gating entry into the Development phase.
user-invocable: true
author: Mangesh Pise <mppise@gmail.com>
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

# Application Architecture

Understand that the entire application architecture comprises of following building blocks:

- An application is comprised of one or more **Components**. Components are high-level capabilities provided by the application, (e.g. Order Management, Secure login, etc.) Each component relies on the overall application architecture principles and technology choices, however they may operate as an independent part of the application, or get used as reusable components across the application (e.g. logging).

  - Each component provides one or more **Features**. A feature indicates how the component can be used by an end-user as well as other components (like a service). Features can also be thought of as a function and therefore __some features__ within a component can only be declared for internal use within a component (like helper functions).

    - Both, components and features must follow the overall application architecture principles and standards defined in `./SPECS/artifacts/B_Architecture.md`.

## Agile Development 

This application architecture that is comprised of components and features, also supports agile development approach. In fact, that should be the general approach applied during design, development, and maintenance of this application. Below are some clarification on how this will work. 

```
  Q: Where do "User Stories" come into play?
  A: While components describe the "What" and features describe the "How", user stories tend to capture the "Why" behind the software application's purpose. Hence, the user story could often cut across multiple features within (and sometimes across) the component. A user story is NEITHER s task, NOR a singular feature. User stories are not formally documented in this framework and can be provided by me as prompts.
```

```
  Q: Then, what are "Epics"?
  A: Because it is counter-intuitive to develop an entire application software at once, the agile development approach allows build and maintenance to occur in Sprints or Iterations. An Epic covers one sprint that comprises of multiple related stories that cut across multiple components and multiple features within and across components. An Epic answers, "What major outcome are we trying to achieve over next few weeks?" Like user stories, Epics as well are not formally documented in this framework and can be provided by me as prompts.
```

# Recording Outcomes

All changes during the planning phase are confined to `./SPECS/artifacts/B_Architecture.md`, `./SPECS/artifacts/C_Assumptions.md`, `./SPECS/artifacts/D_Decisions.md`, and `./SPECS/artifacts/E_Risks.md`. No other files are to be created or modified.

## Numbering System for Artifacts

Use the following 10-character nomenclature to generate unique IDs in each of the artifacts:
  ```
  ^[ADR]-[a-zA-Z0-9]{8}$
  ```
  i.e. To reach exactly 10 characters, we break it down like this:
  - Prefix (2 chars): [ADR]- (The letter + the hyphen).
  - Suffix (8 chars): [a-zA-Z0-9]{8} (Any combination of alphanumeric characters).
