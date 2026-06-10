#!/usr/bin/env bash
# =============================================================================
# push-to-github.sh
#
# Idempotent script to stage, commit (Conventional Commits), and push this
# project to GitHub under the btholath account.
#
# Usage:
#   bash scripts/push-to-github.sh [REPO_NAME]
#
# Example:
#   bash scripts/push-to-github.sh retirement-ai-dashboard
#
# Prerequisites:
#   - git
#   - gh (GitHub CLI) authenticated: gh auth login
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
GITHUB_USER="btholath"
REPO_NAME="${1:-retirement-ai-dashboard}"
DEFAULT_BRANCH="main"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

REPO_DESCRIPTION="AI-assisted retirement dashboard built with Next.js 16, TypeScript & Claude Code. Demonstrates agentic workflows, MCP integration, and prompt engineering for retirement annuity management."

TOPICS=(
  nextjs typescript tailwindcss react
  claude-code anthropic agentic-ai prompt-engineering multi-agent mcp
  retirement-planning annuity fintech
  server-components portfolio
)

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
log()  { echo "[INFO]  $*"; }
warn() { echo "[WARN]  $*" >&2; }
die()  { echo "[ERROR] $*" >&2; exit 1; }

require() {
  command -v "$1" >/dev/null 2>&1 || die "'$1' is required but not installed. $2"
}

# ---------------------------------------------------------------------------
# Preflight checks
# ---------------------------------------------------------------------------
require git  "Install via: sudo apt-get install git"
require gh   "Install via: https://cli.github.com  →  gh auth login"

cd "$REPO_ROOT"
log "Working directory: $REPO_ROOT"
log "Target repository: https://github.com/${GITHUB_USER}/${REPO_NAME}"

# ---------------------------------------------------------------------------
# Git init (idempotent)
# ---------------------------------------------------------------------------
if [[ ! -d ".git" ]]; then
  git init --initial-branch="$DEFAULT_BRANCH"
  log "Initialized new git repository."
else
  log "Git repository already initialized."
fi

# Set identity from global config (fall back to GitHub username)
GIT_NAME="$(git config --global user.name  2>/dev/null || echo "Biju Tholath")"
GIT_EMAIL="$(git config --global user.email 2>/dev/null || echo "${GITHUB_USER}@users.noreply.github.com")"
git config user.name  "$GIT_NAME"
git config user.email "$GIT_EMAIL"

# Ensure main branch
CURRENT_BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null || echo "")"
if [[ "$CURRENT_BRANCH" != "$DEFAULT_BRANCH" ]]; then
  git checkout -B "$DEFAULT_BRANCH"
  log "Switched to branch '$DEFAULT_BRANCH'."
fi

# ---------------------------------------------------------------------------
# .gitignore guard
# ---------------------------------------------------------------------------
GITIGNORE_ENTRIES=(".env" ".env.local" ".env*.local" "*.pem" ".DS_Store")
for entry in "${GITIGNORE_ENTRIES[@]}"; do
  if ! grep -qF "$entry" .gitignore 2>/dev/null; then
    echo "$entry" >> .gitignore
    log "Added '$entry' to .gitignore"
  fi
done

# ---------------------------------------------------------------------------
# Commit helper — only commits if there are staged changes
# ---------------------------------------------------------------------------
commit_if_staged() {
  local message="$1"
  if ! git diff --cached --quiet; then
    git commit -m "$message"
    log "Committed: $(echo "$message" | head -1)"
  else
    log "Nothing to commit for: $(echo "$message" | head -1)"
  fi
}

# ---------------------------------------------------------------------------
# Commit 1 — chore: project scaffold & configuration
# ---------------------------------------------------------------------------
git add \
  CLAUDE.md \
  AGENTS.md \
  .gitignore \
  next.config.ts \
  tsconfig.json \
  postcss.config.mjs \
  eslint.config.mjs \
  package.json \
  package-lock.json \
  next-env.d.ts \
  app/globals.css \
  app/favicon.ico \
  public/ \
  2>/dev/null || true

commit_if_staged "chore: initialize Next.js 16 project scaffold

- Tailwind CSS v4, TypeScript strict mode, ESLint configured
- CLAUDE.md with senior architect rules and domain context
- AGENTS.md with agentic Next.js conventions
- Base layout with Geist font and metadata"

# ---------------------------------------------------------------------------
# Commit 2 — feat: retirement dashboard homepage
# ---------------------------------------------------------------------------
git add \
  app/layout.tsx \
  app/page.tsx \
  src/types/participant.ts \
  src/data/participants.json \
  src/lib/participants.ts \
  src/lib/formatters.ts \
  src/components/ParticipantCard.tsx \
  2>/dev/null || true

commit_if_staged "feat(dashboard): add retirement participant dashboard homepage

- Participant interface with runtime type guard (no unsafe cast)
- getParticipants() service reads and validates JSON data
- ParticipantCard reusable component with Tailwind card styling
- formatCurrency (Intl.NumberFormat, module-scoped) and pluralize utils
- Responsive grid layout: 1 → 2 → 3 → 4 columns (sm/lg/xl breakpoints)
- Server component — zero client-side JS for initial render"

# ---------------------------------------------------------------------------
# Commit 3 — docs: Claude Code workflow guides
# ---------------------------------------------------------------------------
DOC_FILES=()
while IFS= read -r f; do
  DOC_FILES+=("$f")
done < <(git ls-files --others --exclude-standard -- '*.md' 2>/dev/null || true)

if [[ ${#DOC_FILES[@]} -gt 0 ]]; then
  git add "${DOC_FILES[@]}"
  commit_if_staged "docs: add Claude Code workflow and prompt engineering guides

- Session startup and context management guides
- Model selection and usage documentation
- Prompt engineering examples for agentic code generation
- GitHub repository setup and commit workflow documentation"
fi

# ---------------------------------------------------------------------------
# Commit 4 — chore: add push-to-github script
# ---------------------------------------------------------------------------
git add scripts/ 2>/dev/null || true
commit_if_staged "chore(scripts): add idempotent GitHub push script

- Conventional Commits structure across scaffold / feat / docs layers
- Idempotent: safe to run repeatedly without duplicate commits
- Configures remote, creates GitHub repo via gh CLI if needed
- Sets repository description and topics automatically"

# ---------------------------------------------------------------------------
# GitHub repository — create if it doesn't exist
# ---------------------------------------------------------------------------
if ! gh repo view "${GITHUB_USER}/${REPO_NAME}" &>/dev/null; then
  log "Creating GitHub repository: ${GITHUB_USER}/${REPO_NAME}"
  gh repo create "${GITHUB_USER}/${REPO_NAME}" \
    --public \
    --description "$REPO_DESCRIPTION"
  log "Repository created."
else
  log "Repository already exists: ${GITHUB_USER}/${REPO_NAME}"
fi

# ---------------------------------------------------------------------------
# Remote — configure if not set
# ---------------------------------------------------------------------------
if ! git remote get-url origin &>/dev/null; then
  git remote add origin "$REMOTE_URL"
  log "Remote 'origin' added: $REMOTE_URL"
else
  EXISTING_REMOTE="$(git remote get-url origin)"
  if [[ "$EXISTING_REMOTE" != "$REMOTE_URL" ]]; then
    git remote set-url origin "$REMOTE_URL"
    log "Remote 'origin' updated to: $REMOTE_URL"
  else
    log "Remote 'origin' already correct."
  fi
fi

# ---------------------------------------------------------------------------
# Push
# ---------------------------------------------------------------------------
git push -u origin "$DEFAULT_BRANCH"
log "Pushed to ${REMOTE_URL}"

# ---------------------------------------------------------------------------
# Set repository topics
# ---------------------------------------------------------------------------
TOPIC_ARGS=()
for topic in "${TOPICS[@]}"; do
  TOPIC_ARGS+=(--add-topic "$topic")
done

gh repo edit "${GITHUB_USER}/${REPO_NAME}" "${TOPIC_ARGS[@]}" \
  && log "Topics applied." \
  || warn "Topic update failed (check repo admin permissions)."

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------
echo ""
echo "============================================================"
echo "  Repository: https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo "============================================================"
