---
name: status
description: Maintains status of the project lifecycle develoiped using SpecGantry. Status in '[ ]' will be maintained by DevLead to indicate approval or pending action.
---

# Project Status Tracker

| [] | Phase | Started on | Completed on | Notes |
| :-- | :-- | :-- | :-- |
| [ ] | Ideation | {{ active since }} | {{ completed on, else leave empty if active }} | {{ relevant details about the phase in a short single statement }} |

# Component Status Tracker

| [] | Component | Started on | Ready on | Completed on | Notes |
| :-- | :-- | :-- | :-- |
| [ ] | {{ pre-populate separate row for individual functional components after the end of planning phase. if an already completed component goes into maintenance, update the 'Started on' and clear 'Ready on' and 'Completed on' columns so the team knows that the component is under development. }}

# Version History

{{ record version history, and primarily show current active version }}

| Version | Active | Notes |
| :-- | :-- | :-- |
| {{ major and minor version }} | {{ [X] if deployed, else [ ] if ready for deployment }} | {{ notes in a short single statement }} |
