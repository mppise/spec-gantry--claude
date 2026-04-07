---
name: design
argument-hint: functional_component_name
description: Drives the detailed design phase for one of the component identified in the architecture planning phase.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to drive the detailed design phase for one of the components identified in the architecture planning phase. This is done by relying on your project knowledge from the `./.artifacts` directory, mainly the `./.artifacts/B_Architecture.md` file. Specifications created in this phase must be correct, maintainable by technical and functional teams, and traceable back to the architecture.

Begin by capturing the current pulse of the project in terms of assumptions, decisions, and risks. These will be updated throughout the design phase as the individual components take shape. 

**NOTE**: Proceed ONLY when you find that all assumptions, decisions, and risks are acknowledged. Ask me to go into specific artifact files where open items are found.


## Scoped Component

The component that is being designed in this phase is {{ functional_component_name }}. Refer to the `./.artifacts/B_Architecture.md` file for high-level details about this component, and create detailed specifications in following parts, where each part is created as a separate specification document under `./.components/{{ functional_component_name }}` directory:

- **A_Purpose.md**: Describe the purpose of this component in detail. This should include the functionality it provides, the problems it solves, and how it fits into the overall architecture. In addition to purpose, also list all the "features" that this component must have to fulfill its purpose. While listing the features, also provide a brief description for each feature, and identify which features are "must-have" vs "nice-to-have". This will help in prioritization during development and ensure that critical functionality is delivered first. Format the features in a table with the following columns: 

```
| [] | ID | Feature | Description | Priority (Must-have / Nice-to-have) |
| :--: | :-- | :-- | :-- | :--: |
{{ [X] indicates my confirmation of the feature as a requirement. [-] indicates feature should be ignored, while [ ] indicates that the feature is still under consideration and needs further discussion. }}
```

- **B_Dependencies.md**: Identify which other components this component relies on. This should include both internal dependencies (other components within the architecture) and external dependencies (third-party services, libraries, etc.).

- **C_Data.md**: Describe which data elements are involved in this component. This should include the data that the component consumes, produces, and any data transformations that occur within the component.

- **D_ExecutionMode.md**: Specify whether this component is a background process or not. If it is a background process, describe how it operates, how it is triggered, frequency, and any relevant details about its execution. If it is an online process, describe how it interacts with users or other components.

- **E_ExternalServices.md**: Identify which external services this component consumes. This should include details about the APIs or interfaces used to interact with these services.

- **F_ExposedServices.md**: Identify which services this component exposes. This should include details about the APIs or interfaces that other components or external entities can use to interact with this component.

- **G_AICapabilities.md**: Specify whether this component provides any AI capabilities. If it does, describe the nature of these capabilities, how they are implemented, and how they fit into the overall functionality of the component.

- **H_Events.md**: Identify which Events this component consumes and produces. This should include details about the event-driven architecture, if applicable, and how events are used to facilitate communication between components.

- **I_NFR.md**: Specify critical non-functional requirements (NFR) for this component, such as performance, accessibility, security, etc. This should include any specific metrics or thresholds that must be met to ensure the component functions effectively within the overall architecture.

This structure of the specifications will allow appropriate teams to capture and maintain relevant details about the component in an organized manner, ensuring that all aspects of the component's design are thoroughly documented and easily accessible for reference during development and maintenance.


# How This Skill Works

This skill runs in two sequential stages. Do not skip or reorder them.

- **Assess** — read entire project knowledge from the `./.artifacts` directory. Specifically rely on the `./.artifacts/B_Architecture.md` to drive the assessment of scoped component.

- **Complete** — Assist in creating detailed specifications for the scoped component by populating the documents mentioned above. Ensure that all specifications are correct, maintainable by technical and functional teams, and traceable back to the architecture. Any new assumptions, risks, or unresolved items surfaced during detailed design must be continously logged in the appropriate artifact.


# Recording Outcomes

The specification will be created in `./.components/{{ functional_component_name }}` directory, but no files should be created or modified outside of this sub-directory during this phase, except for logging any new assumptions, risks, or unresolved items in the appropriate artifact in the `./.artifacts` directory.

Update the "Component Status Tracker" in `./STATUS.md` to reflect the current status of the detailed design for this component. Do not update status for any other component.

Only once all components are completed, update the "Project Status Tracker" in `./STATUS.md` to indicate that the detailed design phase is complete, and notify me that the project is ready to enter the **Development** phase for this component.
