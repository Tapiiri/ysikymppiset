AGENTS.MD — Operating Manual for Autonomous Coding Agents

This document tells an AI coding agent how to contribute safely and effectively to this event‑site template. Follow it exactly; human review assumes these rules are enforced.

1. Mission & Scope

Primary goal: Maintain and extend a solo‑operator event website + DNS automation platform, keeping the zero‑touch philosophy intact.

You may modify:

Jekyll content, layouts, SCSS theme, images

Terraform modules & DNS records

GitHub Actions workflows and composite action

Tests, lint configs, helper scripts

You must NOT modify:

Git history outside your PR branch

Environments or secrets directly in GitHub — use .secrets + helper script instead

Terraform Cloud workspace settings via API (leave backend config as is)

2. Repository Topology (Quick Reference)

Path

Language

Purpose

\_config.yml

YAML

Global site metadata & feature flags

fi/, en/

Markdown + Liquid

Localised pages

\_layouts/, assets/css/

HTML + SCSS

Site shell and theme

terraform/\*\*

HCL + JSON

Hetzner DNS IaC

.github/workflows/

YAML

CI/CD pipeline

.github/actions/terraform-apply

Bash + YAML

Reusable composite action

tests/

TypeScript (ts‑jest)

Unit tests & CI helpers

.husky/, \*.prettierrc

Shell, JSON

Pre‑commit & formatter configs

3. Development Workflow Checklist

Sync main. git checkout -b feat/<slug> origin/main.

Install deps.

brew install ruby node # or equivalents
bundle install && npm ci

Run site locally (if web changes). bundle exec jekyll serve.

Run selective tests. npm test -- run-tests-based-on-changes — should exit 0.

Pre‑commit hooks. Staging files automatically triggers Prettier + tests. Ensure hook passes.

Commit & push. Follow commit style type(scope): subject (Conventional Commits).

CI must be green. The PR will run full workflow; fix failures before requesting human review.

4. Formatting & Static Analysis Rules

Tool

Invocation

Key Rules

Prettier

npm run format

Uses @shopify/prettier-plugin-liquid for Liquid/HTML. No manual line‑breaks.

Stylelint (SCSS)

npm run lint:css

Enforce BEM naming, no !important.

ShellCheck

shellcheck <file>

All shell scripts must pass.

tflint

Auto‑run in CI

No hard‑coded provider versions.

The pipeline will fail on any formatting or linter error.

5. Branch & Commit Conventions

Branch: feat/…, fix/…, chore/…, ci/….

Commit message:

<type>(<scope>): <short description>

Body (wrap at 72 chars). Explain **why**, not just what.

If a commit changes public behavior (e.g., new DNS record), append BREAKING CHANGE: footer section.

6. Secrets Handling

Never commit raw secrets.

Place required env vars in .secrets (ignored by Git).

Run ./update_github_env_and_secrets.sh <environment> to sync.

Validate in CI: missing secrets abort the workflow.

7. Terraform Guidelines

Input JSON first. Add/edit DNS records in terraform/dns_records.json; do not touch the module unless necessary.

Provider pins. Keep explicit version constraints (~>) and update only via isolated PR.

Plan vs Apply. CI runs terraform plan on PRs and apply only after merge to main.

No state output. Never read or write terraform.tfstate locally; backend is remote.

8. Jekyll & Content Rules

Multi‑language pages must have identical file structures under each locale.

Use Liquid includes for repeated blocks.

All images <400 kB; optimise PNGs with oxipng or JPEG with mozjpeg.

Front‑matter dates use ISO‑8601.

9. Testing Strategy

Area

Test type

Location

Trigger

Composite Action

ts‑jest unit

tests/\*.test.ts

Always

Terraform helper scripts

ts‑jest

same

On infra file changes

Liquid templates

Visual regression (TODO)

tests/visual/

Manual

tests/test-dependencies.json maps file globs → tests; editing mapping requires corresponding tests.

10. Dependency Policy

Allowed package managers: Bundler, npm. No yarn, pnpm.

Pin versions in Gemfile.lock and package-lock.json.

New runtime deps require human approval and must be justified in PR description.

11. PR Description Template (autofill!)

### 🔍 What & Why

- <!-- 1–2 sentence purpose -->

### 📸 Screenshots / Diffs

- <!-- attach before/after if UI -->

### ✅ Checklist

- [ ] Prettier, linters, selective tests pass locally
- [ ] CI is green
- [ ] Secrets unaffected or updated
- [ ] I have added/updated documentation where needed

12. Guardrails for Autonomous Behaviour

Abort if CI pipelines are red on main.

Limit each PR to a logically coherent change — aim for <500 LOC diff.

Never push directly to main.

If uncertain, open a draft PR and request human feedback instead of guessing.

13. Common Tasks Cheat‑Sheet

Task

Steps

Add a DMARC record

1. Edit dns_records.json. 2) Commit. 3) Verify CI plan in PR.

Localise a new language

1. Duplicate pages to xx/. 2) Add xx to \_config.yml. 3) Update nav Liquid include.

Upgrade Ruby gems

1. bundle update. 2) Commit lock file. 3) Ensure CI passes.

Refactor composite action

1. Modify in ./actions/terraform-apply. 2) Update tests.

14) Versioning & Releases

This template uses SemVer via Git tags.

Bump version only from human review; agent may prepare PR with chore(release): vX.Y.Z.

15. Contact & Escalation

For ambiguous situations or failed pipelines the agent cannot repair, open an issue titled AGENT-BLOCKED: <summary> and assign @maintainer.

Follow these guidelines precisely to ensure safe, deterministic, and maintainable automation.
