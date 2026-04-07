---
name: documentation
argument-hint: key_feature
description: Generates user documentation for a given feature.
user-invocable: false
license: Apache-2.0 (see LICENSE in project root)
---


# Objective

The objective of this skill is to create comprehensive user documentation for a specific feature of the software. This documentation should be clear, concise, and easy to understand for end-users. It should cover all relevant aspects of the feature, including its purpose, how to use it, and any important considerations or limitations. The documentation will be published as help content when users seek assistance related to the feature, so it should be structured in a way that allows users to quickly find the information they need.

## Scope

Note the key feature for which you will generate documentation:

{{ key_feature }}


# How This Skill Works

This skill operates in three main stages. Do not skip or reorder them.

- **Research** — gather all necessary information about the feature, including its functionality, user interface, and any relevant technical details. This may involve reviewing project documentation, consulting with developers, and testing the feature to understand its behavior.

- **Draft** — create a draft of the user documentation based on the information gathered. Use clear and simple language to ensure that the documentation is accessible to a wide range of users. 

  - Documentation must be generated in HTML format using standardized page structure styles by `bootstrap` to ensure consistency and readability across all documentation pages.

  - The draft should include sections such as an overview of the feature, step-by-step instructions for using it, and any important notes or warnings.

  - In order to ensure docuentation is reviewed and approved by me, insert following tag at the top of the documentation:

    ```
    <div style="display:none">
      <table>
        <th>
          <td>Status</td>
          <td>Date</td>
        </th>
        <tr>
          <td>{{ 'Pending Review' | 'In Progress' | 'Approved' | 'Rejected' }}</td>
          <td>{{ MMM DD, YYYY }}</td>
      </table>
    </div>
    ```

- **Review and Refine** — review the draft documentation for accuracy, clarity, and completeness. Make any necessary revisions to improve the quality of the documentation. This may involve adding examples, clarifying instructions, or reorganizing content for better flow.


# Recording Outcomes

All documentations will be stored in the `<UX code directory>/docs` sub-directory. Each documentation file should be named according to the feature it describes, following a consistent naming convention (e.g., `feature_name.html`).
