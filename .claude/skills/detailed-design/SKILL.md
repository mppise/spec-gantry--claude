---
name: detailed-design
argument-hint: functional_component_name
description: Drives the detailed design phase for one of the component identified in the architecture planning phase.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to drive the detailed design phase for one of the components identified in the architecture planning phase. This is done by relying on your project knowledge from the `./SPECS/artifacts` directory, mainly the `./SPECS/artifacts/B_Architecture.md` file. Specifications created in this phase must be correct, maintainable by technical and functional teams, and traceable back to the architecture.

Begin by capturing the current pulse of the project in terms of assumptions, decisions, and risks. These will be updated throughout the design phase as the individual components take shape. If new items are surfaced in any of these areas, they must be logged and you must immediately STOP until I review the item and provide my input.

**NOTE**: Proceed ONLY when you find that all assumptions, decisions, and risks are acknowledged. Ask me to go into specific artifact files where open items are found.

## Scoped Component

The component that is being designed in this phase is {{ functional_component_name }}. Refer to the `./SPECS/artifacts/B_Architecture.md` file for high-level details about this component, and create detailed specifications in following parts, where each part is created as a separate specification document under `./SPECS/components/{{ functional_component_name }}` directory:

- **A_Core_Spec.md**: This is the primary specification for the component. It consolidates the following critical areas:
  - **Purpose**: Detailed description of functionality, problems it solves, and overall fit in the architecture.
  - **Features**: A table of all features with Status, ID, Description, and Priority (Must-have / Nice-to-have).
  - **Dependencies**: Internal (other components) and external (libraries, services) dependencies.
  - **Data**: Data consumed, produced, and internal transformations.
  - **Execution Mode**: Whether it's a background or online process and its trigger mechanism.
  
- **B_Interfaces.md**: Detailed definition of the "Contract" for the component:
  - **Exposed Services**: APIs, interfaces, and signatures the component provides to others.
  - **Consumed Services**: External APIs and interfaces the component relies on.
  - **Events**: Event-driven architecture details (events consumed and produced).

- **C_Specialized_Specs.md**: This is a conditional file. Create it ONLY if the component involves:
  - **AI Capabilities**: Implementation details and integration of AI models.
  - **Non-Functional Requirements (NFR)**: Specific performance, security, or accessibility thresholds.
  - **Complex State**: Detailed state machine or concurrency logic.

# How This Skill Works

This skill runs in two sequential stages. Do not skip or reorder them.

- **Assess** — read entire project knowledge from the `./SPECS/artifacts` directory. **Mandatory Anchor**: You MUST read `./SPECS/artifacts/B_Architecture.md` first to anchor the component design to the high-level architecture. Specifically rely on the `./SPECS/artifacts/B_Architecture.md` to drive the assessment of scoped component.

- **Complete** — Assist in creating the consolidated specification package for the scoped component. Ensure that all specifications are correct, maintainable by technical and functional teams, and traceable back to the architecture. Any new assumptions, risks, or unresolved items surfaced during detailed design must be continously logged in the appropriate artifact.

# Recording Outcomes

The specification will be created in `./SPECS/components/{{ functional_component_name }}` directory, but no files should be created or modified outside of this sub-directory during this phase, except for logging any new assumptions, risks, or unresolved items in the appropriate artifact in the `./SPECS/artifacts` directory.

Update the "Component Status Tracker" in `./STATUS.md` to reflect the current status of the detailed design for this component. Do not update status for any other component.
