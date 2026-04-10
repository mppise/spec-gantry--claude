---
name: develop
argument-hint: functional_component_name
description: Drives the development phase by implementing features against the architecture plan, maintaining artifacts, and keeping the build clean — gating exit via the deployment-readiness skill.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to implement the specified functional component by relying on your project knowledge from the `./SPECS/artifacts` directory, but also the specifications created in the detailed design phase for that component. Code written in this phase must be correct, maintainable by a human developer, and traceable back to the architecture and component specifications.

Begin by capturing the current pulse of the project in terms of assumptions, decisions, and risks. These will be updated throughout the development phase as the individual components take shape. If new items are surfaced in any of these areas, they must be logged and you must immediately STOP until I review the item and provide my input.

**NOTE**: Proceed ONLY when you find that all assumptions, decisions, and risks are acknowledged. Ask me to go into specific artifact files where open items are found.

## Scoped Component

The component that is being developed in this phase is {{ functional_component_name }}. Refer to `./SPECS/components/{{ functional_component_name }}/` directory for detailed specifications about this component, and implement the features and tasks identified in those specifications.


# How This Skill Works

This skill runs in four sequential stages. Do not skip or reorder them.

- **Assess** — read entire project knowledge from the `./SPECS/artifacts` directory. **Mandatory Anchor**: You MUST read `./SPECS/artifacts/B_Architecture.md` first to anchor the implementation to the high-level architecture. Specifically rely on the specfications within `./SPECS/components/{{ functional_component_name }}` to code all the components in specified build order.

- **Complete** — implement the features and tasks identified in the assessment. Write maintainable code. Any new assumptions, risks, or unresolved items surfaced during development must be continously logged in the appropriate artifact.
  - **Discovery Pivot**: If you identify a design flaw, a conflict with architecture, or a significantly better approach while coding, you must immediately STOP, signal a "Discovery Pivot", and use `/brainstorm` to analyze the new path before updating specs.
  - **Change Tiers**: 
    - **Major**: Follow full cycle.
    - **Minor (Fast-Track)**: Propose spec and code updates in one review cycle.
    - **Trivial**: Update code and add Implementation Note to spec.

- **Document** — ensure that all code is well-documented with comments explaining the purpose and functionality of complex sections. This will help ensure that the code is maintainable by a human developer in the future.

- **User Documentation** — for each feature implemented, ensure that user documentation is created using the `documentation` skill. This documentation should be clear and concise, providing end-users with the information they need to effectively use the feature. Create references to the user documentation in code comments where appropriate to link the implementation with the documentation.

# Recording Outcomes

The source code itself will be created in `/src` directory, but no files should be created or modified outside of that during this phase.

Code must follow the scaffolding and formatting style as specified in `./CLAUDE.md` to ensure maintainability. All code should be traceable back to the specifications and architecture. Any new assumptions, risks, or unresolved items surfaced during development must be logged in the appropriate artifact in the `./SPECS/artifacts` directory.
