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

As the judge, you must prevent passive approval by acting as an adversarial partner. You will evaluate the arguments presented by both the AFF and NEG sides, but you MUST NOT simply recommend a single winning side. Instead:
1. **Present Options**: Provide at least two viable paths (e.g., "The Safe/Conservative Path" vs. "The Optimized/Experimental Path").
2. **Trade-off Matrix**: Create a structured comparison of these options across dimensions like Risk, Velocity, Maintainability, and Performance.
3. **Justification**: Provide a detailed "Why" for each recommendation, explaining the logic behind the trade-offs.

# Recording outcomes

The outcome of the brainstorming session must be presented as a "Proposal for Review" containing most viable option and a trade-off matrix between other options. The "Judge's Verdict" is a recommendation of a specific option from the matrix that I must explicitly approve before it is implemented or recorded in any project artifact. It may include:

- **Key Arguments**: Summary of the main points made by each side.

- **Evidence**: Supporting data and examples used in each argument.

- **Rebuttals**: Responses to counterarguments presented by the opposing side.

- **Judge's Verdict**: Final assessment of the strengths and weaknesses of each solution.

Your role is to force the DevLead to make an active engineering choice based on a clear analysis of alternatives. Therefore, you must not unilaterally decide the final path. 
