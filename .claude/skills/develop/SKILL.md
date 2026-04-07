---
name: develop
argument-hint: functional_component_name
description: Drives the development phase by implementing features against the architecture plan, maintaining artifacts, and keeping the build clean — gating exit via the deployment-readiness skill.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to implement the specified functional component by relying on your project knowledge from the `./.artifacts` directory, but also the specifications created in the detailed design phase for that component. Code written in this phase must be correct, maintainable by a human developer, and traceable back to the architecture and component specifications.

Begin by capturing the current pulse of the project in terms of assumptions, decisions, and risks. These will be updated throughout the development phase as the development takes shape. 

**NOTE**: Proceed ONLY when you find that all assumptions, decisions, and risks are acknowledged. Ask me to go into specific artifact files where open items are found.

## Scoped Component

The component that is being developed in this phase is {{ functional_component_name }}. Refer to `./.components/{{ functional_component_name }}/` directory for detailed specifications about this component, and implement the features and tasks identified in those specifications.


# How This Skill Works

This skill runs in two sequential stages. Do not skip or reorder them.

- **Assess** — read entire project knowledge from the `./.artifacts` directory. Specifically rely on the specfications within `./.components/{{ functional_component_name }}` to code all the components in specified build order.

- **Complete** — implement the features and tasks identified in the assessment. Write maintainable code. Any new assumptions, risks, or unresolved items surfaced during development must be continously logged in the appropriate artifact.

- **Document** — ensure that all code is well-documented with comments explaining the purpose and functionality of complex sections. This will help ensure that the code is maintainable by a human developer in the future.

- **User Documentation** — for each feature implemented, ensure that user documentation is created using the `documentation` skill. This documentation should be clear and concise, providing end-users with the information they need to effectively use the feature. Create references to the user documentation in code comments where appropriate to link the implementation with the documentation.


# Recording Outcomes

The source code itself will be created in `/src` directory, but no files should be created or modified outside of that during this phase. You must also make sure that you mark features listed in `./.components/{{ functional_component_name }}/A_Purpose.md` as '[X]' indicating their completion throughout the development phase as the development takes shape.

Code must follow a specific scaffolding and formatting style to ensure maintainability. All code should be traceable back to the architecture document. Any new assumptions, risks, or unresolved items surfaced during development must be logged in the appropriate artifact in the `./.artifacts` directory.

Once all stages are complete, update the "Project Status Tracker" in `./STATUS.md` to record the Development phase as complete, and notify me that the project is ready to enter the **Deployment** phase. However, do note that the project will only be considered fully ready for deployment once the `deployment-readiness` skill is successfully completed, which will involve a comprehensive review of the entire project to ensure that all aspects are in place for a successful deployment.