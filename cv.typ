// Maximilian Ipkovich CV
// Built with Typst · https://typst.app

#import "template.typ": *
#let compact = sys.inputs.at("compact", default: "false") == "true"
#let ai = sys.inputs.at("ai", default: "false") == "true"

#show: cv.with(
  name: "Maximilian Ipkovich",
  tagline: if ai { "AI Engineer | LLM Systems, Multi-Agent Architecture & Production ML" } else { "Software Engineer | AI, Backend & DevOps" },
  contact: (
    (icon: "envelope", text: "maximilian.ipkovich@gmail.com"),
    (icon: "phone", text: "+436644075399"),
    (icon: "location", text: "Vienna, Austria"),
    (icon: "linkedin", text: "/in/mipkovich"),
    (icon: "gitlab", text: "gitlab.com/mipkovich"),
  ),
  // date-of-birth: "1999.08.23",
  // nationality: "Austrian",
  accent-color: rgb("#2563eb"),
)

#if not compact {
  if ai {
    metrics-bar(
      ("3.5y", "at AI FinTech"),
      ("5", "LLM Integrations"),
      ("500+", "Review Comments"),
      ("1,530+", "Tests"),
    )
  } else {
    metrics-bar(
      ("56", "Merged MRs"),
      ("250+", "Issues Authored"),
      ("500+", "Review Comments"),
      ("3.5y", "Tenure"),
    )
  }
}

== Professional Summary

#if ai and compact [
  AI Engineer with 3.5 years at Finmatics (Visma Group), an AI/FinTech invoice automation platform. Evolved from support into a developer role building LLM-integrated microservices (Google Gemini), multi-agent dev tooling, and RAG pipelines. Available from June 2026.
] else if ai [
  3.5 years at Finmatics (Visma Group), an Austrian AI/FinTech company automating invoice processing for enterprises. Evolved from support into a developer role building LLM-integrated microservices with Google Gemini, multi-agent development tooling, and CI/CD infrastructure. Personal projects span RAG pipelines (Athena), LLM architecture research (TAME-Swarm), and a full-stack student toolkit (Sophia — 1,530+ tests). Available from June 2026.
] else if compact [
  3.5 years at Finmatics (Visma Group), building LLM-integrated microservices, Django backend, and CI/CD. Negotiated from support into a dev role. 500+ review actions. Available from June 2026.
] else [
  3.5 years at Finmatics (Visma Group), an Austrian AI/FinTech company automating invoice processing for enterprises. Evolved from support into a developer role building LLM-integrated microservices (Google Gemini), Django backend, and CI/CD infrastructure. Implemented multi-agent dev tooling and a custom MCP server for AI-assisted API testing. 6 personal projects totalling 35,000+ lines and 1,530+ tests across RAG pipelines, multi-agent architectures, and full-stack applications. Available from June 2026.
]

== Work Experience

#experience(
  role: "Developer & Quality Control Engineer",
  company: "Finmatics GmbH (Visma Group)",
  location: "Vienna, Austria",
  dates: "May 2023 - Present",
  description: "Negotiated transition from Application Support to a dual Developer & QC role. Internal tooling, issue triage, release validation, then backend development, AI/LLM microservices, and CI/CD.",
)

#if not compact {
  experience(
    role: "Application Support Engineer",
    company: "Finmatics GmbH (Visma Group)",
    location: "Vienna, Austria",
    dates: "Sep 2022 - May 2023",
    description: "2nd level technical support for enterprise accounting clients. Investigated and documented 130+ customer-reported issues with root cause analysis, contributing to 147 identified bugs and 57 feature requests.",
  )
}

#if ai {
  experience(
    role: "Private",
    company: "Austrian Armed Forces (ÖBH)",
    location: "Austria · Bosnia-Herzegovina",
    dates: "Oct 2019 - July 2022",
    description: "Mandatory military service, border policing operations, EUFOR Althea international peacekeeping (volunteered, extended to max duration).",
  )
} else if compact {
  experience(
    role: "Private",
    company: "Austrian Armed Forces (ÖBH)",
    location: "Austria · Bosnia-Herzegovina",
    dates: "Oct 2019 - July 2022",
    description: "Mandatory military service, border operations with policing powers, EUFOR Althea peacekeeping (extended to max 9-month duration).",
  )
} else {
  experience(
    role: "Private",
    company: "Austrian Armed Forces (ÖBH)",
    location: "Austria · Bosnia-Herzegovina",
    dates: "Oct 2019 - July 2022",
    description: "Mandatory military service, Austrian border operations with policing powers, EUFOR Althea international peacekeeping in Bosnia-Herzegovina (volunteered, extended to max duration).",
  )
}

#if ai [
  === AI/ML & Agent Systems #dates-right[2025 - 2026]

  #if compact [
  - Co-developed the *Content Split Service*, a FastAPI microservice using Google Gemini LLM for automated invoice line item splitting with Pydantic-validated structured output across thousands of enterprise invoices per month
  ] else [
  - Co-developed the *Content Split Service*, a FastAPI microservice using Google Gemini LLM for automated invoice line item splitting with Pydantic-validated structured output across thousands of enterprise invoices per month
  - Added selective caching, exponential-backoff retries, and proper error propagation to the LLM pipeline, fixing persistent failures caused by transient Gemini API errors
  - Built a testing harness that uncovered a pervasive caching bug blocking the feature for months — sales had already won customers with it; fix made this USP feature releasable
  - Set up observability: Sentry failure alerts, InvoiceEvent logging, OpenTelemetry spans for distributed retry tracing
  ]
  - Created the *Finmatics MCP Server* (14 tools, 2,000+ lines) enabling AI assistants to run E2E API tests via natural language — replacing manual Postman/curl workflows for the team
] else [
  === AI/ML & Microservices #dates-right[2025 - 2026]

  #if compact [
  - Co-developed the *Content Split Service*, a FastAPI microservice using Google Gemini LLM for automated invoice line item splitting across thousands of enterprise invoices per month
  ] else [
  - Co-developed the *Content Split Service*, a FastAPI microservice using Google Gemini LLM for automated invoice line item splitting across thousands of enterprise invoices per month
  ]
  - Added selective caching, exponential-backoff retries, and proper error propagation to the LLM pipeline, fixing persistent failures caused by transient Gemini API errors
  - Built a testing harness that substantiated a pervasive caching bug blocking the feature for months — fix made this USP feature releasable; repurposed harness into regression tests
  #if not compact [
  - Set up end-to-end observability: Sentry alerts on failures, InvoiceEvent logging for debugging, OpenTelemetry spans for distributed tracing of retry patterns
  ]
  - Created the *Finmatics MCP Server* (14 tools, 2,000+ lines) so AI assistants can run E2E API tests via natural language, replacing manual Postman/curl workflows
]

#if ai [
  === Agent Infrastructure & Dev Tooling #dates-right[2024 - 2026]

  - Implemented a *Conductor Agent* within the Agentic Workspace: 8 specialized subagents, 11 composable skills, parallel git-worktree execution, and automated GitLab audit trail
  #if not compact [
  - Extended the team's *Agentic Workspace* to VS Code Copilot and integrated the Finmatics API MCP server alongside existing Cursor and Claude Code support
  - Contributed an approved PR to the open-source *GitLab-MCP* npm package, extending its MCP server capabilities for AI-agent GitLab integration
  - Designed and maintained the *GitLab CI Release Bot*: blocks MRs missing a Jira issue, cross-project issue association, deployment validation — cutting manual release overhead
  - Cut CI log volume by ~90% with selective observability config, fixing 10MB log limit truncation blocking test debugging
  ]
] else [
  === Platform Engineering & CI/CD #dates-right[2024 - 2026]

  - Designed and maintained the *GitLab CI Release Bot*: blocks MRs missing a Jira issue, cross-project issue association, deployment validation — cutting manual release overhead
  - Cut CI log volume by ~90% with selective observability config, fixing 10MB log limit truncation that was blocking test debugging
  #if not compact [
  - Extended the team's *Agentic Workspace* to VS Code Copilot and integrated the Finmatics API MCP server alongside existing Cursor and Claude Code support
  - Implemented a *Conductor Agent* within the Agentic Workspace: 8 specialized subagents, 11 skills, parallel worktree execution, and automated GitLab audit trail for the full dev lifecycle
  ]
]

#if ai [
  === Backend & Automation #dates-right[2023 - 2025]

  - Spotted on own initiative and fixed a documentation vs. implementation gap in Premium Product config, stopping free usage of the premium tier
  - Found and fixed critical multi-layer caching bugs with test evidence, unblocking production readiness of the flagship feature
  #if not compact [
  - Built REST APIs for prediction phrases, bank statement Excel exports, and HubSpot CRM integrations with Django REST Framework
  - Built automated customer onboarding with HubSpot CRM integration: company provisioning, user management, branding config — running for years without maintenance
  - Created automated invoice volume reporting via HubSpot Workflow Custom Code Blocks, giving the sales team actionable data in the CRM they use daily
  - Mentored new starters on the production system, pre-release and development environments, and end-to-end user and invoice data flow across them
  ]
] else [
  === Backend Development (Django) #dates-right[2023 - 2026]

  - Spotted on own initiative and fixed a documentation vs. implementation gap in Premium Product config, stopping free usage of the premium tier
  #if not compact [
  - Found and fixed critical multi-layer caching bugs with test evidence, unblocking production readiness of our flagship feature
  - Built REST APIs for prediction phrases, bank statement Excel exports, and HubSpot CRM integrations with Django REST Framework
  ]
]

#if compact and ai [
  === AI Projects & Research #dates-right[2025 - Present]

  - *TAME-Swarm* — experimental MoE variant: VCG auction-based expert routing, 500-step Gemma-2B training (PyTorch · Transformers)
  - *Athena* — RAG pipeline: books/PDFs → GRADE-rated evidence, design constraints & multi-platform content (LightRAG · Claude)
  - *Sophia* — student toolkit: GPU transcription, vector search, multi-LLM integration, FSRS (1,530+ tests, hexagonal architecture)
  - *Conductor Agent* — multi-agent dev orchestrator: 8 subagents, parallel worktree execution, GitLab audit trail
] else if compact [
  === Tooling & Side Projects #dates-right[2022 - Present]

  - *Sophia* — student toolkit: GPU transcription, vector search, LLM topic extraction, FSRS (35k lines, 1,530+ tests)
  - *TAME-Swarm* — experimental MoE variant: VCG auction-based expert routing, 500-step Gemma-2B training (PyTorch · Transformers · FastAPI)
  - *Hephaestus* — self-hosted homelab: 9+ Docker services, Caddy TLS, Tailscale mesh, BuildKit CI
] else if not ai [
  === Automation & Internal Tooling #dates-right[2023 - 2024]

  - Built an *automated customer onboarding system* with HubSpot CRM integration: company provisioning, user management, and branding config — running for years without maintenance, saving hours of recurring work
  - Created automated invoice volume reporting and customer sync via HubSpot Workflow Custom Code Blocks, giving the sales team actionable data in the UI they use daily

  === Technical Support Engineering #dates-right[2022 - 2023]

  - Investigated and documented 130+ customer-reported issues with root cause analysis, contributing to 147 identified bugs across the platform
  - Filed 76 issues in 2023 alone, improving product quality across UI, backend, ML prediction accuracy, and security
  - Authored 57 feature requests and 29 UX improvement proposals based on escalated support tickets
]

== Technical Skills

#if ai and compact {
  skills-grid(
    ("AI / ML & Agents", "RAG Pipelines · ChromaDB · LightRAG · Google Gemini · PyTorch · Transformers · Pydantic Structured Output · Prompt Engineering · Multi-Agent Orchestration · MCP Protocol · Activation Steering"),
    ("Backend & APIs", "FastAPI · Django · DRF · SQLModel · Celery · PostgreSQL · Redis"),
    ("Cloud & MLOps", "Docker · Kubernetes · Helm · GitLab CI/CD · Azure · GCP · Terraform · Sentry · OpenTelemetry"),
    ("Testing", "pytest · Playwright · Cypress · k6 · structured evaluation"),
    ("Languages", "Python · TypeScript · SQL"),
  )
} else if ai {
  skills-grid(
    ("AI / ML & Agents", "RAG Pipelines · ChromaDB · LightRAG · Sentence Transformers · Google Gemini LLM · PyTorch · Hugging Face Transformers · Activation Steering · Pydantic Structured Output · Prompt Engineering · Multi-Agent Orchestration · MCP Protocol · FSRS"),
    ("Backend & APIs", "FastAPI · Django · DRF · SQLModel · Celery · PostgreSQL · Redis"),
    ("Cloud & MLOps", "Docker · Kubernetes · Helm · GitLab CI/CD · Azure · Azure Entra ID · GCP · Terraform · MLflow"),
    ("Testing & Eval.", "pytest · Playwright · Cypress · k6 · Cucumber/Gherkin · structured evaluation pipelines"),
    ("Observability", "Sentry · OpenTelemetry · Jaeger · Structured Logging"),
    ("Languages", "Python · TypeScript · SQL"),
  )
} else if compact {
  skills-grid(
    ("Languages", "Python · TypeScript · SQL · C++ (Unreal Engine)"),
    ("Backend", "Django · DRF · FastAPI · SQLModel · Celery · PostgreSQL · Redis"),
    ("AI / ML", "Google Gemini LLM · RAG · ChromaDB · PyTorch · Transformers · Pydantic Structured Output"),
    ("Cloud & DevOps", "Kubernetes · Helm · Docker · GitLab CI/CD · Azure · GCP · Terraform"),
    ("Testing & Obs.", "pytest · Cypress · Playwright · Sentry · OpenTelemetry"),
  )
} else {
  skills-grid(
    ("Languages", "Python · TypeScript · SQL · C++ (Unreal Engine)"),
    ("Backend", "Django · DRF · FastAPI · SQLModel · Celery · PostgreSQL · Redis"),
    ("AI / ML", "Google Gemini LLM · RAG · ChromaDB · Sentence Transformers · PyTorch · Hugging Face Transformers · Pydantic Structured Output · Prompt Engineering"),
    ("Cloud & DevOps", "Kubernetes · Helm · Docker · GitLab CI/CD · Azure · Azure Entra ID · GCP · Terraform"),
    ("Testing", "pytest · Cypress · Playwright · k6 · Cucumber/Gherkin"),
    ("Integrations", "HubSpot API · REST APIs · DATEV · UBL/E-Invoice · MCP Protocol · CalDAV"),
    ("Observability", "Sentry · OpenTelemetry · Jaeger · Structured Logging"),
  )
}

#if ai and not compact [
  == Key Projects

  #project(
    name: "TAME-Swarm",
    tech: "PyTorch · Transformers · FastAPI · Gradio · Docker",
    description: "Experimental MoE variant grounded in Michael Levin's TAME framework. Replaces standard MoE gating with VCG auction-based expert routing for emergent specialization. 500-step training on Gemma-2B demonstrating measurable expert specialization, with activation steering for drift-resistant alignment.",
  )

  #project(
    name: "Conductor Agent",
    tech: "VS Code Copilot · Claude API · GitLab MCP · Markdown Agent DSL",
    description: "Multi-agent orchestration for the full dev lifecycle within the Finmatics Agentic Workspace. 8 subagents, 11 composable skills, parallel git-worktree execution, and automated GitLab audit trail.",
  )

  #project(
    name: "Hephaestus",
    tech: "Docker Compose · Caddy · Tailscale · GitLab CI · NVIDIA Runtime",
    description: "Self-hosted homelab running 9+ containerized services: GitLab CE, GPU-accelerated ML platform, Ollama LLM inference, CalDAV, media server. Caddy reverse proxy with internal TLS, Tailscale mesh networking with strict ACLs, BuildKit + DinD CI builds, RTX 5070 Ti GPU runner, automated backups with disaster recovery.",
  )

  #project(
    name: "Athena",
    tech: "Python · LightRAG · Marker · Claude API · Pydantic · Rich TUI",
    description: "RAG pipeline with GRADE evidence framework (adapted from evidence-based medicine) for cross-book consensus grading. Transforms books/PDFs into design constraints, rated evidence, and platform-specific content. 5-layer architecture (Parse → Graph → Analyze → Derive → Review) with Pydantic-validated LLM structured output.",
  )

  #project(
    name: "Sophia",
    tech: "Python · ChromaDB · faster-whisper · Gemini/Groq/Ollama · Sentence Transformers · aiosqlite",
    description: "Constructivist student toolkit for TU Wien. Hexagonal architecture with 11 Protocol interfaces, async-first design. GPU transcription, vector search, multi-provider LLM integration, FSRS spaced repetition. 1,530+ tests.",
  )
] else if not compact [
  == Key Projects

  #project(
    name: "TAME-Swarm",
    tech: "PyTorch · Transformers · FastAPI · Gradio · Docker",
    description: "Experimental MoE variant grounded in Michael Levin's TAME framework. VCG auction-based expert routing replacing standard MoE gating, enabling emergent specialization through mechanism design. 500-step training on Gemma-2B showing expert specialization (Gini 0.12–0.35) and positive performance EMA. Activation steering for drift-resistant alignment.",
  )

  #project(
    name: "Hephaestus",
    tech: "Docker Compose · Caddy · Tailscale · GitLab CI · NVIDIA Runtime",
    description: "Self-hosted homelab running 9+ containerized services: GitLab CE, GPU-accelerated ML platform, Ollama LLM inference, CalDAV, media server. Caddy reverse proxy with internal TLS, Tailscale mesh networking with strict ACLs, BuildKit + DinD CI builds, RTX 5070 Ti GPU runner, automated backups with disaster recovery.",
  )

  #project(
    name: "Sophia",
    tech: "Python · httpx · ChromaDB · faster-whisper · Gemini/Groq/Ollama · aiosqlite · structlog · rich",
    description: "Constructivist student toolkit for TU Wien. Hexagonal architecture with 11 Protocol interfaces and async-first design. GPU-accelerated lecture transcription, semantic vector search (ChromaDB), multi-provider LLM integration (Gemini/Groq/Ollama), FSRS spaced repetition. 1,530+ tests, GitLab CI.",
  )
]

== Education

#education(
  degree: "BSc Informatics (Computer Science)",
  institution: "TU Wien (Vienna University of Technology)",
  location: "Vienna, Austria",
  dates: "Feb 2026 - Present (expected 2029)",
  details: "Part-time alongside full-time engineering role",
)

== Languages

#languages(
  ("German", "Native"),
  ("English", "Bilingual proficiency (C2)"),
)
