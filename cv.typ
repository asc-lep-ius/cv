// Maximilian Ipkovich — CV
// Built with Typst · https://typst.app

#import "template.typ": *

#show: cv.with(
  name: "Maximilian Ipkovich",
  tagline: "Software Engineer — AI & Platform Engineering",
  contact: (
    (icon: "envelope", text: "max.ipkovich@gmail.com"),
    (icon: "phone", text: "+43 XXX XXX XXXX"),
    (icon: "location", text: "Vienna, Austria"),
    (icon: "linkedin", text: "linkedin.com/in/maximilian-ipkovich"),
    (icon: "github", text: "github.com/asc-lep-ius"),
  ),
  // date-of-birth: "DD.MM.YYYY",
  // nationality: "Austrian",
  accent-color: rgb("#2563eb"),
)

== Professional Summary

Software Engineer with 3.5 years of experience building AI-powered financial document processing systems at Finmatics (Visma Group). Full-stack expertise across Python/Django backend, Angular frontend, and FastAPI microservices, with hands-on LLM integration (Google Gemini) and Kubernetes platform engineering. Proven track record of delivering production systems processing thousands of invoices daily, with strong contributions to code quality (250+ issues authored, 500+ code review comments).

== Work Experience

#experience(
  role: "Software Engineer",
  company: "Finmatics GmbH (Visma Group)",
  location: "Vienna, Austria",
  dates: "Sep 2022 – Feb 2026",
  description: "AI-powered financial document processing platform for accounting firms and enterprises. Evolved from technical support to full-stack platform engineering.",
)

=== AI/ML & Microservices #dates-right[2025 – 2026]

- Owned the *Content Split Service* — FastAPI microservice using Google Gemini LLM for automated invoice line item splitting with retry logic, selective caching, and structured output parsing
- Architected error propagation and observability (Sentry alerts, InvoiceEvent logging) for AI pipeline monitoring
- Investigated BRAID structured prompting methodology (arXiv:2512.15959) for 2–3× accuracy improvement in LLM content extraction
- Built custom *MCP Server* (14 tools, 2,000+ lines) enabling AI assistants to run E2E API tests through natural language

=== Platform Engineering & CI/CD #dates-right[2024 – 2026]

- Designed and maintained *GitLab CI Release Bot* — automated release note generation, cross-project issue association, and deployment validation
- Reduced CI log volume by ~90% through selective observability module configuration, solving test debugging truncation issues
- Managed Kubernetes deployments via Helm charts across development, release, and production environments
- Designed multi-agent AI development workspace orchestrating Cursor, Claude Code, and VS Code Copilot with 8 specialized agents and 11 shared skills

=== Backend Development #dates-right[2023 – 2026]

- Redesigned SSC/QA configuration from Opt-Out to Opt-In architecture, preventing billing exposure for unconfigured customers
- Developed REST APIs for prediction phrases, bank statement exports, and CRM integrations using Django REST Framework
- Identified and fixed critical caching bugs (`@cached_property` stale state, LRU + Redis over-caching) validated through systematic test evidence
- Diagnosed AlloyDB JSONB incompatibility during GCP migration — traced Django ORM SQL generation to specific affected locations with proposed fixes

=== Automation & Internal Tooling #dates-right[2023 – 2024]

- Built *automated customer onboarding system* with HubSpot CRM integration — company provisioning, user management, and branding configuration
- Rewrote onboarding codebase from procedural to OOP architecture, containerized with Docker, and added CI/CD pipeline
- Created automated invoice volume reporting and customer data synchronization tools via HubSpot API workflows
- Developed Cypress + Cucumber E2E testing framework for frontend integration testing

=== Technical Support Engineering #dates-right[2022 – 2023]

- Investigated and documented 130+ customer-reported issues with detailed root cause analysis and reproduction steps
- Identified security vulnerabilities in user permissions and host configuration
- Filed 76 issues in 2023, improving product quality across UI, backend, and ML prediction accuracy

== Technical Skills

#skills-grid(
  ("Languages", "Python (Expert) · TypeScript · Dart"),
  ("Backend", "Django · Django REST Framework · FastAPI · Celery"),
  ("Frontend", "Angular · RxJS · NgRx · HTML/CSS"),
  ("AI/ML", "Google Gemini LLM · Prompt Engineering · OCR · MLflow · Document AI"),
  ("DevOps", "Kubernetes · Helm · Docker · GitLab CI/CD · GitHub Actions"),
  ("Cloud", "Azure · Google Cloud Platform · AlloyDB · PostgreSQL · Redis"),
  ("Integrations", "HubSpot API · REST APIs · Camunda · DATEV · UBL/E-Invoice"),
  ("Observability", "Sentry · OpenTelemetry · Jaeger · Structured Logging"),
  ("Testing", "pytest · Cypress · Playwright · k6 · Cucumber/Gherkin"),
  ("Tools", "Git · Jira · MCP Protocol · Streamlit"),
)

== Education

#education(
  degree: "YOUR DEGREE HERE",
  institution: "YOUR UNIVERSITY HERE",
  location: "Vienna, Austria",
  dates: "YYYY – YYYY",
)

== Languages

#languages(
  ("German", "Native"),
  ("English", "Fluent (C1–C2)"),
)

== Key Projects

#project(
  name: "Agentic Workspace",
  tech: "Python · MCP · Cursor · Claude Code · VS Code Copilot",
  description: "Multi-agent AI development platform providing unified pipeline across three AI coding assistants with 8 specialized agents, 11 skills, and custom MCP server for API test automation",
)

#project(
  name: "Content Split Service",
  tech: "FastAPI · Google Gemini · Pydantic · Redis",
  description: "Production microservice for LLM-powered invoice line item splitting with retry logic, selective caching, and distributed tracing",
)

#project(
  name: "Auto-Onboarding System",
  tech: "Python · HubSpot API · Docker · Kubernetes",
  description: "Full-stack customer provisioning automation — CRM integration, company/user creation, branding configuration, and CI/CD deployment",
)
