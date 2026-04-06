---
name: explain-code
argument-hint: code_snippet_for_explanation
description: Explains code functionality and logic in simple terms.
user-invocable: true
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective of this skill is to analyze a given code snippet and provide a clear, concise explanation of its functionality and logic in simple terms. This skill is designed to help users understand complex code by breaking it down into more digestible pieces.

## Issue for explanation

Note the code snippet below that must be explained:

{{ code_snippet_for_explanation }}


# How This Skill Works

This skill runs in three sequential stages. Do not skip or reorder them.

- **Assess** — read the provided code snippet carefully. Identify the programming language, key constructs, and overall structure of the code.

- **Explain** — provide a step-by-step explanation of what the code does. Focus on the main logic, the purpose of each section, and how different parts of the code interact with each other. Use simple language and avoid technical jargon where possible.

- **Summarize** — conclude with a brief summary of the code's overall functionality and its intended use case. If there are any potential edge cases or important considerations related to the code, include those in the summary as well.


# Recording Outcomes

No files (artifacts, code, etc.) are generated or updated by this skill. This skill will produce a well-formatted explanation of the code snippet provided as input. This explanation should be clear and easy to understand, even for those who may not be familiar with the programming language used in the code.