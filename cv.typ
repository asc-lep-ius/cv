// Maximilian Ipkovich CV
// Built with Typst · https://typst.app

#import "template.typ": *

#show: cv.with(
  name: "Maximilian Ipkovich",
  tagline: "Software Engineer | AI, Backend & Quality Assurance",
  contact: (
    (icon: "envelope", text: "maximilian.ipkovich@gmail.com"),
    (icon: "phone", text: "+436644075399"),
    (icon: "location", text: "Vienna, Austria"),
    (icon: "github", text: "github.com/asc-lep-ius"),
  ),
  // date-of-birth: "1999.08.23",
  // nationality: "Austrian",
  accent-color: rgb("#2563eb"),
)

#metrics-bar(
  ("56", "Merged MRs"),
  ("250+", "Issues Authored"),
  ("500+", "Review Comments"),
  ("3.5y", "Tenure"),
)

== Professional Summary

3.5 years at Finmatics (Visma Group), an Austrian AI/FinTech company that automates invoice processing for accounting firms and enterprises. My repsonsibilities include LLM-integrated microservices (Google Gemini), Monolith Django backend, and platform engineering. Built multi-agent AI dev tooling and a custom MCP server for smoke and API testing. 500+ review actions, 250+ authored technical specs.

== Work Experience

#experience(
  role: "Quality Control Engineer & Developer",
  company: "Finmatics GmbH (Visma Group)",
  location: "Vienna, Austria",
  dates: "May 2023 – Present",
  description: "Progressed from automation engineering and internal tooling to platform-level backend development, AI/LLM microservice integration, and CI/CD infrastructure across Django and FastAPI.",
)

#experience(
  role: "Application Support Engineer",
  company: "Finmatics GmbH (Visma Group)",
  location: "Vienna, Austria",
  dates: "Sep 2022 – May 2023",
  description: "2nd level technical support for enterprise accounting clients. Investigated and documented 130+ customer-reported issues with root cause analysis, contributing to 147 identified bugs and 57 feature requests.",
)

=== AI/ML & Microservices #dates-right[2025 – 2026]

- Contributed to the *Content Split Service*, a FastAPI microservice using Google Gemini LLM for automated invoice line item splitting across thousands of enterprise invoices
- Added selective caching, exponential-backoff retries, and proper error propagation to the LLM pipeline, fixing persistent failures caused by transient Gemini API errors
- Set up end-to-end observability: Sentry alerts on failures, InvoiceEvent logging for debugging, OpenTelemetry spans for distributed tracing of retry patterns
- Created the *Finmatics MCP Server* (14 tools, 2,000+ lines, 54 commits) so AI assistants can run E2E API tests via natural language, replacing manual UI and Postman/curl workflows for staging deployments by QC and PM Teams

=== Platform Engineering & CI/CD #dates-right[2024 – 2026]

- Designed and maintained the *GitLab CI Release Bot*: blocks MRs missing a Jira issue, handles cross-project issue association and deployment validation, cutting manual release overhead for the team
- Cut CI log volume by ~90% with selective observability config, fixing 10MB log limit truncation that was blocking test debugging
- Contributed to the *Agentic Workspace*, a multi-agent AI dev platform with 8 specialized agents and 11 shared skills running across Cursor, Claude Code, and VS Code Copilot (1000+ lines of agent/skill code)

=== Backend Development (Django) #dates-right[2023 – 2026]

- Spotted and fixed a gap between documentation and actual Premium Product configuration implementation on my own initiative, stopping hundreds of customers from using the premium tier for free
- Found and fixed critical multi-layer caching bugs (`@cached_property` + LRU + Redis over-caching) with systematic test evidence; this had been blocking production readiness of our flagship premium feature for months
- Built REST APIs for prediction phrases, bank statement Excel exports, and HubSpot CRM integrations with Django REST Framework

=== Automation & Internal Tooling #dates-right[2023 – 2024]

- Built an *automated customer onboarding system* with HubSpot CRM integration: company provisioning, user management, and branding config. Saved the support team dozens of hours of repetitive work per month
- Created automated invoice volume reporting and production customer sync through HubSpot API workflow scripts, giving the sales team data they could actually act on

=== Technical Support Engineering #dates-right[2022 – 2023]

- Investigated and documented 130+ customer-reported issues with detailed root cause analysis and reproduction steps, contributing to 147 identified bugs across the full platform
- Filed 76 issues in 2023 alone, improving product quality across UI, backend, ML prediction accuracy, and security
- Authored 57 feature requests and 29 UX improvement proposals based on tickets escalated to the 2nd level of support

== Technical Skills

#skills-grid(
  ("Languages", "Python · TypeScript · SQL · C++"),
  ("Backend", "Django · Django REST Framework · FastAPI · Celery · PostgreSQL · Redis"),
  ("AI / ML", "Google Gemini LLM · OCR (Tesseract) · MLflow · Document AI"),
  ("Cloud & DevOps", "Kubernetes · Helm · Docker · GitLab CI/CD · Azure · GCP · Terraform"),
  ("Testing", "pytest · Cypress · Playwright · k6 · Cucumber/Gherkin"),
  ("Integrations", "HubSpot API · REST APIs · DATEV · UBL/E-Invoice · MCP"),
  ("Observability", "Sentry · OpenTelemetry · Jaeger · Structured Logging"),
)

== Key Projects

#project(
  name: "Conductor Agent",
  tech: "Markdown Agents · Subagent Spawning · Cursor · Claude Code · VS Code Copilot",
  description: "Orchestrates the full dev lifecycle from request to reviewed implementation. Routes tasks by complexity, utilizes frontmatter for more optimal subagent model selection, spawns parallel research subagents (codebase, web, git history), generates phased TDD plans with approval gates, and runs iterative Implementer/Reviewer loops with automated revision cycles. Works across Cursor, Claude Code, and VS Code Copilot.",
)

#project(
  name: "Finmatics MCP Server",
  tech: "FastMCP · httpx · Pydantic · tenacity",
  description: "Custom MCP server for running API and smoke tests against staging/local via natural language. Shared HTTP client via lifespan, JWT auto-refresh, production safety blocklist, and exponential-backoff retry. Works in VS Code Copilot, Claude Code, and Cursor.",
)

#project(
  name: "Auto-Onboarding System",
  tech: "Python · HubSpot Workflow Custom Code Blocks",
description: "End-to-end customer provisioning automation. CRM integration for company/user creation, branding config, and role assignment, with HubSpot's ticket pipeline repurposed as the UI. Took hours of repetitive work off the support team's plate.",
)

== Education

#education(
  degree: "BSc Informatics (Computer Science)",
  institution: "TU Wien (Vienna University of Technology)",
  location: "Vienna, Austria",
  dates: "Feb 2026 – Present",
  details: "Part-time alongside full-time engineering role",
)

== Languages

#languages(
  ("German", "Native"),
  ("English", "Bilingual proficiency (C2)"),
  ("Spanish", "Limited working proficiency (A2)")
)
