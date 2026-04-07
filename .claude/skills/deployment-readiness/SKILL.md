---
name: deployment-readiness
description: Produces a complete release readiness package including changelog, code review gate, technical debt scan, smoke tests, rollback plan, and communication draft — gating entry into the Deployment phase.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to produce a complete release preparation package — everything needed to ship confidently and recover quickly if something goes wrong. 

This skill __does not__ perform the actual release, but merely produces the release readiness log that I can review to kick-off a release confidently.

Checking readiness to deploy after development phase using this skill is NECESSARY before moving on to the actual deployment phase. 

Follow the sections below to generate the release package with individual release readiness log files that cover changelog, code review gate, technical debt scan, pre-release checklist, smoke test plan, migration notes, rollback plan, and communication draft. Each section will generate its individual review item indicated by [X] if review passed or [ ] if review failed. 

For each section, you will begin by first listing all review items that need to be checked off. Then, you will actually conduct the review and check-off (or not) each item. If any item cannot be checked off, provide a clear explanation of what is missing or needs to be addressed before it can be checked off.


# How This Skill Works

This skill runs in seven sequential stages. Do not skip or reorder them. Each stage corresponds to a specific aspect of release readiness and will produce its own log file in the `./.artifacts/rel_{{ yyyy.mm.dd_hh:mm }}` directory. The stages are as follows:

## 1. Components Included in Release (`components.md`)

List all components that are included in this release. This should be a comprehensive list of all the components that have changes in this release, including both new features and bug fixes. For each component, provide a brief description of the changes that are included in this release. This will help ensure that all stakeholders have a clear understanding of what is being released and can review the changes accordingly.

It is possible that initially, not all functional components are included in this release. So you must also provide a list of components that are NOT included in this release but are planned for future releases. This will help set expectations and provide visibility into the roadmap for future development.

## 2. Changelog (`changelog.md`)

Summarize all changes since the last release, organized by type:

- **Features** — new capabilities shipped to users

- **Fixes** — bugs resolved

Format each entry as: `[component/area] Short description of change`

## 3. Code Review Gate (`code-review.md`)

Review the code for syntax, architecture alignment, security concerns, maintainability issues, and best practices. Also validate if new code introduces side-effects or issues for other components. Identify any issues that should block the release, categorizing them by severity. Group by severity (i.e. SEV-1, SEV-2, SEV-3, where SEV-1 is highest). Use following format for each item:

```
* [{{ 'X' if review passed, ' ' if review failed }}] **[component/area]** Summarize the impact
```

## 4. Technical Debt Scan (`tech-debt.md`)

Review the code for following technical debt categories introduced in this release:

- **Code Quality** — duplicated logic, overly complex functions, poor naming, dead code

- **Test Coverage** — missing unit tests, untested edge cases, flaky tests, no integration tests

- **Architecture** — tight coupling, layer violations, missing abstractions, wrong pattern for the use case

- **Documentation** — undocumented APIs, stale comments, missing ADRs (Architecture Decision Records)

- **Dependencies** — outdated packages, transitive vulnerabilities, pinned-but-forgotten versions

- **Operational** — missing logging, no health checks, manual deployment steps, no rollback procedure

- **Security** — hardcoded secrets, overly broad permissions, unvalidated inputs at boundaries

Group by severity (i.e. SEV-1, SEV-2, SEV-3, where SEV-1 is highest). Use following format for each item:

```
* [{{ 'X' if review passed, ' ' if review failed }}] **[category]** Summarize the impact
```

## 5. Smoke Test Plan (`smoke-tests.md`)

Note: Execute this step only if code review gate and technical debt scan report no blockers.

Define the minimum set of manual or automated checks to run immediately after deploy to confirm the release is healthy:

- What are the top 3–5 user-critical flows to verify?
- What system-level checks confirm the deployment succeeded (health endpoints, queue depths, error rates)?
- What is the acceptable time window to observe before declaring the release stable?

Group by category (i.e. USER-FLOW, SYSTEM-CHECK, etc.). Use following format for each item:

```
### [ ] **{{ scenario }}** 

[component/area] Test plan description
```

## 6. Rollback Plan (`rollback-plan.md`)

Note: Execute this step only if code review gate and technical debt scan report no blockers.

Define how to revert if the release needs to be pulled:

- How is a rollback triggered? (feature flag, redeploy previous tag, etc.)

- Are database migrations reversible? If not, what is the safe state?

- What is the estimated time to rollback?

- Who needs to be notified and how?

## 7. Communication (`communication.md`)

Note: Execute this step only if code review gate and technical debt scan report no blockers.

Draft the release announcement (internal or external as appropriate):

- What changed that users/stakeholders care about

- Any action required on their part

- Known issues or limitations in this release

## 8. Deployment Scripts and Configurations

Note: Execute this step only if code review gate and technical debt scan report no blockers.

Prepare a deployment shell scripts (`./deploy/go.sh`), configuration files (`./deploy/config.json`) to perform actual deployment. These should be parameterized to allow for quality and production environments and include necessary safeguards (e.g. confirmation prompts, environment variable checks) to prevent accidental misuse.


# Recording Outcomes

Only the release readiness log files stated in each section will be created in the `./.artifacts/rel_{{ yyyy.mm.dd_hh:mm }}` directory. No other artifacts must be updated during this phase.

Only if a fresh deployment readiness is requested, ignore any previous runs and start with a clean `./.artifacts/rel_{{ yyyy.mm.dd_hh:mm }}` directory otherwise assume the latest run is being used to determine the change in status of the blockers.

Once all stages are complete, update the "Project Status Tracker" in `./STATUS.md` to record the Deployment phase as complete, and notify me that the project is ready to enter the **Deployment** phase. At this point, also add an entry to the "Version History" in `./STATUS.md` marking the new version as `[X]` Active — it has cleared deployment readiness and is ready to deploy.