---
name: plan
description: Drives the planning phase from a complete A_Project.md to a fully defined B_Architecture.md with decisions, assumptions, and risks captured — gating entry into the Development phase.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to translate a validated project idea into a complete technical plan. That means `./.artifacts/B_Architecture.md` is fully defined, all key technical decisions, and proper build sequence are logged, and the project is ready to enter development without unresolved ambiguity.

Having a complete architecture and development plan as the output of this skill is NECESSARY before moving on to the actual development phase where code will be written.

Begin by capturing the current pulse of the project in terms of assumptions, decisions, and risks. These will be updated throughout the planning phase as the architecture takes shape.


# How This Skill Works

This skill runs in three sequential stages. Do not skip or reorder them.

- **Assess** — read `./.artifacts/A_Project.md` as the source of truth for what is being built (do not modify it), then evaluate the current state of `./.artifacts/B_Architecture.md` to determine what is missing or undefined.

- **Complete** — work through each missing or undefined area in `./.artifacts/B_Architecture.md` using the targeted questions below. Ask one topic at a time. Wait for my answer before moving to the next. Do not invent responses. If my answer is vague, ask a follow-up until it is specific enough to document. NOTE: Some topics may not be relevant to the specific project. So give me an option to skip any topic that does not apply.

  - **Tech Stack** — What language(s), frameworks, and runtimes? Are any already decided or are they open?

  - **Components / Modules** — What are the major building blocks of the system and how do they relate to each other?

  - **Data** — What data does the system store, in what form, and where? What is the read/write pattern?

  - **APIs / Interfaces** — What are the entry points into the system (JSON-RPC, REST, CLI, event-driven, etc.)? Who calls them?

  - **AI Integration** — Does the system use any AI capabilities? If so: which models or providers will be used, how output will be validated, and explained? 
  
    - GenAI based AI capabilities that rely on prompts should be centralized, parameterized, and stored in a way that allows them to be iterated on without code changes.

    - Ask about MCP (Model Context Protocol) support if GenAI is involved. The application must also be deisgned to expose relevant MCP servers for external integration and extensibility.

  - **User Experience** — What does the user-facing surface look like? Identify the key user flows and whether a design system or component library is in play. Mobile-first, Cloud-first, and AI-first principles must be mandatorily considered and applied where relevant.

  - **Observability & Analytics** — How will the system be monitored in production? Cover operational observability (logging, tracing, alerting, dashboards) and product analytics (user behavior tracking, funnel metrics, analytics platform). What does "something is wrong" look like and who gets paged? Logging must be structured (log-level, coded, context, etc.), centralized (custom logging service), and traceable (origin, correlation, etc.).

  - **Security** — How is access controlled? Are there any authentication, authorization, or data sensitivity concerns?

  - **Compliance & Privacy** — Are there regulatory requirements (GDPR, CCPA, HIPAA, SOC 2, etc.)? How is PII identified, protected, and retained or purged? Are there audit-logging or right-to-erasure obligations?

  - **Third-party Integrations** — What external services, SDKs, or webhooks does the system depend on? For each: what is the failure mode if it is unavailable, and is there a fallback?

  - **Scalability** — What are the expected traffic or load levels at launch and at 10× growth? Is the design horizontal or vertical? Where are the bottlenecks and how will they be addressed?

  - **Error Handling & Resilience** — How does the system behave under partial failures? Identify retry policies, circuit-breaker patterns, graceful degradation paths, and recovery procedures for critical flows.

  - **Notifications & Messaging** — Does the system need to send notifications (email, push, SMS, in-app)? If so, what platform handles delivery, and how are preferences, opt-outs, and delivery failures managed?

  - **Deployment** — Where does this run and how does it get there? What does the target environment look like? Document the platform, secrets strategy, and deploy mechanism. Do NOT include deployment scripts or CI/CD pipeline files in the development plan — these are produced by the Deployment phase, not the Development phase.

  - **Testing Strategy** — What types of tests are expected (unit, integration, e2e)? Are there coverage expectations?

- **Challenge** — stress-test the completed architecture across four dimensions, viz. consistency, completeness, risk, and simplicity. Conduct each review yourself and utilize artifacts until resolved.


# Recording Outcomes

All changes during the planning phase are confined to `./.artifacts/B_Architecture.md`, `./.artifacts/C_Assumptions.md`, `./.artifacts/D_Decisions.md`, and `./.artifacts/E_Risks.md`. No other files are to be created or modified.

Once all stages are complete, update the "Project Status Tracker" in `./STATUS.md` to record the Planning phase as complete, and notify me that the project is ready to enter the **Detailed Design** phase.
