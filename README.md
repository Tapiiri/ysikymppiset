Event‑Site Template — "Everything‑in‑Git"

A zero‑click workflow for launching and maintaining a minimalist event website and its DNS from a single repository. Built for one operator who prefers pull‑requests over web consoles.

✨ Why this template exists

Solo‑friendly automation. After cloning, every operation — writing copy, adding pictures, registering a domain, publishing the site — happens by editing files and pushing to GitHub.

One canonical source of truth. All code, content, infrastructure, secrets metadata, and tests live in the repo, making rebuilds or roll‑backs trivial.

No local "snowflake" set‑up. Terraform runs only in CI, Jekyll needs nothing but Ruby, and the deploy pipeline self‑provisions its runtime.

🗺️ Repo layout

.
├── \_config.yml # Site metadata (event date, links, languages, feature flags)
├── fi/ & en/ # Per‑language Markdown pages
├── \_layouts/ & assets/ # HTML shells, SCSS theme, images
├── terraform/ # Infrastructure‑as‑Code (Hetzner DNS module, backend, variables)
├── .github/
│ ├── workflows/deploy.yml # CI pipeline: lint → test → terraform apply → Jekyll build
│ └── actions/terraform‑apply/ # Reusable composite action
└── tests/ # ts‑jest unit tests for the action & helper scripts

🚀 Quick‑start (5 steps)

Create your repo. gh repo create my‑event && cd my‑event && git remote add template <this‑repo>

Copy secrets template.

cp .example.env .env
cp .example.secrets .secrets

# Fill HETZNER_DNS_TOKEN and any other blanks

Push secrets to GitHub.

./update_github_env_and_secrets.sh production

Edit \_config.yml. Change event name, date, and any feature flags.

Register / point your domain. Add or modify records in terraform/dns_records.json and commit.

CI will run Terraform Cloud, create the DNS entries, build the site with Jekyll, and publish via GitHub Pages. 🎉

🏗️ Local development tips

brew install ruby node # or your OS equivalents
bundle install # Jekyll + plugins
npm ci # Linting & test tooling
bundle exec jekyll serve # http://localhost:4000

Pre‑commit hooks (Husky) will auto‑format changed files and run tests.

🛠️ How it works

Layer

Tooling & Files

What to touch

Site content

Markdown in fi/, en/, \_posts/…

Write / translate copy

Theme

assets/css/main.scss

Adjust colours, fonts, animations

Metadata

\_config.yml

Event date, location URL, enable gallery, etc.

Infrastructure

JSON‑driven DNS list → terraform/hetzner_dns module

Add A/CNAME/TXT records

Pipeline

.github/workflows/deploy.yml + composite action

Change CI behaviour if really needed

🌐 DNS & Terraform in 90 seconds

Define records in plain JSON.

Push → GitHub Actions injects secrets → terraform apply runs with auto‑approve.

State lives in Terraform Cloud (remote backend) so nothing is stored in the repo.

You never run terraform locally, never copy/paste zone file snippets, and never open the Hetzner UI.

🔑 Secrets management

.env✅ Non‑sensitive defaults (e.g. DOMAIN_NAME)

.secrets🔒 Real tokens (e.g. HETZNER_DNS_TOKEN)

Run the helper script whenever you change either file; it uses the GitHub CLI to sync repository environment‑scoped variables so the pipeline only has access in the chosen environment (e.g. production).

🧪 Tests & quality gates

Prettier + Liquid plugin keeps Markdown, HTML, and SCSS tidy.

Husky pre‑commit blocks unformatted or failing commits.

Selective Jest suites mean edits to CSS don’t waste time executing Terraform mocks.

The goal is fast feedback for a solo maintainer.

🔄 Common tasks

Goal

Action

Add a new language

Duplicate fi/index.markdown → sv/index.markdown, add sv to languages: array in \_config.yml.

Swap hero image

Replace assets/images/hero.png.

Add SPF or DMARC

Append a TXT record in dns_records.json and commit.

Rotate tokens

Update .secrets and rerun update_github_env_and_secrets.sh.

Upgrade Jekyll plugins

bundle update locally → push.

🗜️ Keeping the template up‑to‑date

Periodically check upstream changelogs for:

Jekyll & plugins (ruby gems)

Terraform providers (Hetzner DNS)

GitHub Actions (composite action runs pinned versions — bump deliberately)

Deal with them in a dedicated branch to let CI validate everything before merging.

📄 License

MIT — do what you want, no warranty.

Enjoy running your next event site without ever leaving your editor! ✌️
