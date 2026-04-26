---
name: develop
argument-hint: functional_component_name
description: Drives the development phase by implementing features against the architecture plan, maintaining artifacts, and keeping the build clean — gating exit via the deployment-readiness skill.
user-invocable: true
author: Mangesh Pise <mppise@gmail.com>
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

- **Status Update** — update the status of each of the listed Features in `./SPECS/components/{{ functional_component_name }}/A_Core_Spec.md` to reflect the completion feature by feature.


# AI Specific Guidelines: Prompting, Tool Use, and Code Generation

You manage AI prompts as files. Always follow these conventions when creating, editing, or loading prompts.

## File Types

**`<id>.prompt.md`** — prose prompts (system instructions, extraction prompts, behavioral rules)

Structure: YAML frontmatter block, then the prompt body in Markdown. The body — everything after the closing `---` — is the exact string sent to the AI.

**`<id>.tools.yaml`** — tool/function definitions sent to the AI API

Structure: pure YAML, no frontmatter. Top-level keys are `id`, `description`, and `tools` (array).

## Frontmatter Schema for `.prompt.md`

Every `.prompt.md` file opens with a frontmatter block:

    ---
    id: <unique_identifier>
    description: <one-line summary of what this prompt does and when it is used>
    loader_params:
      - name: PARAM_NAME
        format: <expected format, e.g. "ISO 8601 date string", "JSON array of strings">
        injected_by: <module or call site that supplies this value at runtime>
        purpose: <why the AI needs this value>
    ---

Rules:
- If the prompt has no runtime parameters, set `loader_params: []`
- `loader_params` documents runtime token injection only — it has no relation to AI tool/function parameter schemas

## Parameter Injection

Use `{{PARAM_NAME}}` tokens anywhere in the prompt body. They are replaced with real values at runtime before the prompt is sent to the AI.

Rules:
- Every `{{TOKEN}}` in the body must be declared in `loader_params` — undeclared tokens throw at load time
- Every declared param must be supplied at the call site — missing values throw at load time
- Parameters are always injected as plain strings

## Loader Contract

A shared loader at `src/prompts/loader.js` exposes two functions:

    loadPrompt(id, params?) → string
    loadTools(id)           → object[]

**`loadPrompt(id, params?)`**
- Reads `src/prompts/<id>.prompt.md`
- Strips the frontmatter block; returns only the prompt body as a plain string
- Injects `params` values into `{{TOKEN}}` placeholders before returning
- Throws if called on a `.tools.yaml` file
- Throws if a declared param is missing from `params`
- Throws if the body contains an undeclared `{{TOKEN}}`

**`loadTools(id)`**
- Reads `src/prompts/<id>.tools.yaml`
- Returns the value of the top-level `tools` key as a JavaScript array
- Throws if called on a `.prompt.md` file

## Complete File Examples

### Example `.prompt.md`

    ---
    id: extract-line-items
    description: Extracts invoice line items from raw OCR text. Used by the invoice-parser service.
    loader_params:
      - name: RAW_TEXT
        format: plain string, may contain newlines
        injected_by: invoice-parser/extract.js
        purpose: the OCR output the AI will parse
      - name: CURRENCY
        format: ISO 4217 code, e.g. "USD"
        injected_by: invoice-parser/extract.js
        purpose: tells the AI which currency to normalise amounts to
    ---

    Extract all line items from the invoice text below.

    Return a JSON array. Each element must have:
    - `description` (string)
    - `quantity` (number)
    - `unit_price` (number, in {{CURRENCY}})
    - `total` (number, in {{CURRENCY}})

    Return only valid JSON — no prose, no code fences.

    Invoice text:
    {{RAW_TEXT}}

### Example `.tools.yaml`

    id: web-actions
    description: Tools for reading and writing web content. Used by the research agent.
    tools:
      - name: fetch_url
        description: |-
          Fetches the HTML content of a URL and returns it as a string.
          Use this when you need to read a web page.
        input_schema:
          type: object
          properties:
            url:
              type: string
              description: The fully-qualified URL to fetch, including https://
          required:
            - url
      - name: search_web
        description: |-
          Runs a web search and returns the top results.
          Use this when you need to find current information.
        input_schema:
          type: object
          properties:
            query:
              type: string
              description: The search query
            max_results:
              type: integer
              description: Number of results to return. Defaults to 5.
          required:
            - query

## YAML Multi-line Strings

Use `|-` for multi-line `description` values in `.tools.yaml`:
- `|` preserves line breaks, adds a trailing newline
- `-` strips the trailing newline
- `|-` together: preserves line breaks, no trailing newline — correct for API consumption

## Markdown Formatting for Prompt Bodies

- `##` headings for major sections
- `---` horizontal rules to separate top-level sections
- `-` bullets for rules; `1.` numbered lists for sequential steps
- **Bold** for critical constraints
- Inline code for field names, tag names, and literal values
- Indented code blocks (4-space indent) for schemas and output examples — **not** fenced code blocks, which break SKILL.md rendering
- Tables for type mappings or option comparisons
- `- [ ]` checklists for self-verification gates

## Directory Layout

  src/prompts/
    loader.js       ← shared loader (the only non-prompt file)
    *.prompt.md     ← prose prompts
    *.tools.yaml    ← tool definitions


# Recording Outcomes

The source code itself will be created in `./src` directory, but no files should be created or modified outside of that during this phase. Even the environment variables must be used from `./src/.env`. If unavailable, create it and either update it with available information or request me to do that.

Code must follow the scaffolding and formatting style as specified in `./CLAUDE.md` to ensure maintainability. All code should be traceable back to the specifications and architecture. Any new assumptions, risks, or unresolved items surfaced during development must be logged in the appropriate artifact in the `./SPECS/artifacts` directory.

## Numbering System for Artifacts

Use the following 10-character nomenclature to generate unique IDs in each of the artifacts:
  ```
  ^[ADR]-[a-zA-Z0-9]{8}$
  ```
  i.e. To reach exactly 10 characters, we break it down like this:
  - Prefix (2 chars): [ADR]- (The letter + the hyphen).
  - Suffix (8 chars): [a-zA-Z0-9]{8} (Any combination of alphanumeric characters).

