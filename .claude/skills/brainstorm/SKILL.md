---
name: brainstorm
argument-hint: issue_for_brainstorming
description: This skill must be used every time an issue is identified where there is no clear approach or the approaches identified have significant trade-offs. The skill will brainstorm the issue and identify most favorable approach to solve the issue at hand.
user-invocable: false
license: Apache-2.0 (see LICENSE in project root)
---

# Objective

The objective here is to facilitate a structured brainstorming session that encourages completeness by effectively capturing the idea, evaluating them with a positive and negative lens, and recommend a final approach to go about solving the issue at hand.

This skill can be used for any type of issue, whether it is to solidify requirements (functional and/or technical), determine coding approaches, deployment approaches, management approaches, etc. The key is to be able to capture the issue in a clear and concise manner in the context of this application, and then evaluate potential solutions from different angles to ensure that we are considering all possible options before making a decision.

## Issue for brainstorming

Note the issue below that must be brainstormed:

{{ issue_for_brainstorming }}


# How This Skill Works

Brainstorming will follow the structure of the Lincoln-Douglas debate format, which consists of the following stages:

| Stage | Description |
| :--- | :--- |
| **Affirmative Constructive (1AC)** | The Affirmative (always) reads a pre-written case, outlining why the resolution is valid. |
| **Cross Examination (CX)** | The Negative asks the Affirmative questions, in order to expose logical flaws in the Affirmative's argument. |
| **Negative Constructive (1NC / 1NR)** | The Negative (almost always) reads a pre-written case and (almost always) moves on to address the Affirmative case. |
| **Cross Examination (CX)** | The Affirmative asks the Negative questions. |
| **First Affirmative Rebuttal (1AR)** | The Affirmative addresses both their opponent's case and their own. This speech is considered by many debaters to be the most difficult speech, as debaters must use 4 minutes to respond to a 7-minute speech, whereas the Negative has 6 minutes to respond to the 1AR of only 4 minutes. |
| **Negative Rebuttal (NR / 2NR)** | The Negative addresses the arguments of the previous speech and summarizes the round for the judge. New arguments and evidence are typically frowned upon because the affirmative only has 3 minutes to respond to this speech. |
| **Second Affirmative Rebuttal (2AR)** | The Affirmative addresses the arguments of the previous speech and summarizes the round for the judge. No new arguments or evidence are allowed in the 2AR because the negative does not have another speech to answer these final arguments. |

## Personas Involved

You will perform the brainstoring in a manner that is similar to the Lincoln-Douglas debate format, where you will independently play 3 sides of the argument - the affirmative (AFF), the negative (NEG), and the Judge.

As you switch roles during the brainstorming process, this approach must be able to highlight different angles to consider when coming up with most optimal solution to the issue raised in the context of this project.

### AFF

The affirmative (AFF) side will focus on the positive aspects of the potential solutions, highlighting the benefits, advantages, and strengths of each solution. This perspective will help us understand the value and potential impact of each solution, and how it can contribute to solving the issue at hand.

### NEG

The negative (NEG) side will focus on the potential drawbacks, disadvantages, and weaknesses of each solution. This perspective will help us identify potential risks, challenges, and limitations associated with each solution, and how they can impact the overall success of the project.

### Judge

As the judge, you will evaluate the arguments presented by both the AFF and NEG sides, considering the strengths and weaknesses of each solution. Your role is to provide an unbiased assessment of the arguments and recommend a winning side based on the overall merits of the solutions presented. This will help us make informed decisions about which solution to pursue in order to effectively address the issue at hand.


# Recording outcomes

The outcomes of the brainstorming session will be recorded in a structured format that captures the key points from each stage of the debate. This will include:

- **Key Arguments**: Summary of the main points made by each side.

- **Evidence**: Supporting data and examples used in each argument.

- **Rebuttals**: Responses to counterarguments presented by the opposing side.

- **Judge's Verdict**: Final assessment of the strengths and weaknesses of each solution.

No files (artifacts, code, etc.) are generated or updated by this skill. This skill will produce a well-formatted explanation of the code snippet provided as input. This explanation should be clear and easy to understand, even for those who may not be familiar with the programming language used in the code.