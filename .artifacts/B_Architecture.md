---
name: architecture
description: Describe the technical architecture details for this project.
---

# ARCHITECTURE

{{ describe the high-level architecture for this project. }}

## Components

{{ identify different modules that must be built for the entire project to be deployed. }}

## Technical-Stack

{{ which would be the most suitable technical stack for this project. if there is a need to use different technologies for specific components, those must be identified. the guiding principle would be to standardize as much as possible. }}

| Layer | Technologies | Notes | Scaffolding |
| :-- | :-- | :-- | : -- |
| Data | {{ recommend choices }} | {{ ratioanle }} | `./src/db` |
| Middleware (APIs) | ExpressJS | Standard framework for application routing as well as exosing REST APIs | `./src/api` |
| Configuration | JSON files | Central configuration file can manage software behaviour | `./src/config` |
| Security (App. Credentials) | {{ recommend choices }} | {{ ratioanle }} | `./src/credentials` |
| Security (External services) | {{ recommend choices }} | {{ ratioanle }} | `./src/credentials` |
| User Experience | HTML + CSS + JavaScript | {{ ratioanle }} | `./src/ui` |

## AI Technologies

Since the preferred platform for this project is {{ Google Cloud Platform | Microsoft Azure | Amazon Web Services }}, the same platfom will serve as provider of AI technologies. The project may need following AI technolgies:

- Large Language Model (LLM): Preferred choice is {{ Google Gemini model | Anthrophic Claude model | OpenAI GPT model }}.

- Text-Embedding Model: Preferred choice is {{ text-embedding model }}.

- Vector Database: Preferred choice is {{ recommend choices }}.

- Prompt Engineering: All finalized prompts will be stored as templates in `./src/ai/prompts` directory in JSON format with structure as below:

    ```
    {
       "system": "{{ system prompt }}",
       "context": "{{ context }}",
       "task": "{{ tasks expected from LLM }}",
       "format": "Generate response in JSON format using the structure provided here - ```json {{ json response structure expected }} ```",
    }
    ```

## Development Strategy

{{ should a specific sequence be adopted to build individual components or technology stacks? }}

## Deployment Strategy

{{ determine where will each application component and/or architecture layer of the application be deployed? Co-deployment is also an acceptable option depending on complexity of the project. }}

Preferred platform for deployment is {{ Google Cloud Platform | Microsoft Azure | Amazon Web Services }}
