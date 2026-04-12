---
name: deployment-readiness
description: Produces a consolidated release readiness audit and a self-contained deployment engine (go.sh) to gate entry into the Deployment phase.
user-invocable: true
author: Mangesh Pise <mppise@gmail.com>
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to produce a complete release preparation package — everything needed to ship confidently and recover quickly if something goes wrong. 

This skill __does not__ perform the actual release, but merely produces the release readiness log and deployment scripts that the User can review to kick-off a release confidently.

Checking readiness to deploy after development phase using this skill is NECESSARY before moving on to the actual deployment phase.

# How This Skill Works

This skill runs in three sequential stages. Each stage ensures that the release is technically sound and the deployment mechanism is robust. The outcomes are recorded in the `./deploy/rel_{{ yyyy.mm.dd_hh:mm }}` directory.

## 1. Release Audit (`release_audit.md`)
Produce a single, comprehensive audit document that serves as the "Gate" for deployment. The header will contain the overall PASS / FAIL verdict. This document must cover:

### A. Scope & Changes
- **Components & Changelog**: A table of components included in the release, their status (New/Updated), and a concise list of features/fixes. Use `./STATUS.md` as a reference.

### B. Technical Audit (Code Review & Tech Debt)
Perform a zero-trust audit of the source code and specs. Identify blockers categorized by severity (SEV-1, SEV-2, SEV-3). 
- **Categories**: Syntax, Architecture, Security, Maintainability, Test Coverage, and Dependencies.
- **Format**: `* [{{ 'X' if passed, ' ' if failed }}] **[Category/Component]** Impact description`

### C. Risk & Recovery
- **Smoke Test Plan**: Top 3–5 critical user flows and system-level health checks to verify after deployment.
- **Rollback Plan**: Trigger mechanism, database reversibility, and estimated time to recover.

**Note**: If any SEV-1 or SEV-2 blockers are identified in the Technical Audit, the process stops here, and the release is marked as FAIL.

## 2. Communication (`release_announcement.md`)
- **Release Announcement**: Draft internal/external announcement covering changes, required actions, and known limitations.

## 3. Deployment Engine (`go.sh`)
Create a self-contained deployment shell script (`./deploy/go.sh`) that removes the need for external config files. The script must include:

- **Environment Readiness Checks**: Before deploying, the script must verify the environment (e.g., Docker daemon running, registry authentication, required CLI tools installed, network connectivity).
- **Multi-Environment Support**: Use flags (e.g., `--env test` or `--env prod`) to switch target environments.
- **Containerized Workflow**: Implementation must follow the build -> push -> deploy pattern for Docker images in a cloud environment.
- **Testing Mode**: For `--env test`, the script should proceed until the application is running and accessible (e.g., patching ports), allowing for immediate verification.
- **Robustness**: Include comprehensive error handling and logging for every step.

## 4. Project Governance Update
Once the audit is passed and the script is ready:
- Update the "Project Status Tracker" in `./STATUS.md` to mark the Deployment phase as complete.
- Add an entry to "Version History" in `./STATUS.md` marking the new version as `[X] Active` (Ready to Deploy).

# Recording Outcomes

Only the `release_audit.md` and `go.sh` files will be created/updated in the `./deploy/rel_{{ yyyy.mm.dd_hh:mm }}` directory (or the base `./deploy/` for the script). 

If a fresh deployment readiness is requested, start with a clean timestamped directory. Otherwise, use the latest run to determine the status of blockers.
