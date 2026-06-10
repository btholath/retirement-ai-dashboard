# retirement-ai-dashboard

![Next.js](https://img.shields.io/badge/Next.js-16-black?logo=nextdotjs)
![TypeScript](https://img.shields.io/badge/TypeScript-strict-blue?logo=typescript)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-v4-38bdf8?logo=tailwindcss)
![Built with Claude Code](https://img.shields.io/badge/Built%20with-Claude%20Code-orange)
![License](https://img.shields.io/badge/license-MIT-green)

> AI-assisted retirement dashboard built with Next.js 16, TypeScript, and Claude Code. Demonstrates agentic workflows, MCP integration, and prompt engineering for retirement annuity and participant account management.

---

## What this demonstrates

| Capability | Implementation |
|---|---|
| **Claude Code** | End-to-end feature generation, refactoring, and code review via CLI |
| **Prompt Engineering** | Structured prompts for code generation, review, and architectural guidance |
| **Agentic Architecture** | `CLAUDE.md` + `AGENTS.md` rules drive consistent AI-assisted development |
| **Next.js 16** | App Router, React Server Components, file-based routing |
| **TypeScript** | Strict mode, interfaces, runtime type guards — no unsafe casts |
| **Retirement Domain** | Participant accounts, annuity balances, projection-ready data model |

---

## Tech stack

- **Framework:** Next.js 16 (App Router)
- **Language:** TypeScript 5 (strict)
- **Styling:** Tailwind CSS v4
- **AI tooling:** Claude Code (Anthropic) with MCP integration
- **Runtime:** Node.js 20+

---

## Project structure

```
├── app/
│   ├── layout.tsx          # Root layout with Geist font
│   └── page.tsx            # Homepage — server component
├── src/
│   ├── components/
│   │   └── ParticipantCard.tsx   # Reusable participant card
│   ├── data/
│   │   └── participants.json     # Seed data
│   ├── lib/
│   │   ├── formatters.ts         # formatCurrency, pluralize
│   │   └── participants.ts       # getParticipants() with type guard
│   └── types/
│       └── participant.ts        # Participant interface
├── scripts/
│   └── push-to-github.sh         # Idempotent GitHub push script
├── CLAUDE.md                     # AI architect rules and domain context
└── AGENTS.md                     # Agentic Next.js conventions
```

---

## Local setup

```bash
# 1. Install dependencies
npm install

# 2. Start the dev server
npm run dev

# 3. Open in browser
open http://localhost:3000
```

---

## Built with Claude Code

This project was built interactively using [Claude Code](https://claude.ai/code), Anthropic's AI-powered CLI. The workflow demonstrates:

1. **Feature generation** — homepage, types, services, and components generated from a structured prompt
2. **Code review** — staff-engineer-level review identifying unsafe casts, module-scope optimizations, and naming conventions
3. **Refactoring** — type guard replacing `as` cast, formatter extracted to `lib/`, `Intl.NumberFormat` hoisted to module scope
4. **Git workflow** — conventional commits created and pushed via an AI-generated idempotent shell script

See [`06_prompt_engineering.md`](./06_prompt_engineering.md) for the exact prompts used.

---

## Roadmap

- [ ] Retirement projection calculator (`src/lib/projections.ts`)
- [ ] Annuity processing service
- [ ] REST API routes (`app/api/participants/`)
- [ ] Vitest unit tests for all lib functions
- [ ] GitHub Actions CI (typecheck + lint)
- [ ] Participant detail page with projection chart

---

## Related

- Blog: [blog.retiriq.com](https://blog.retiriq.com)
- GitHub: [@btholath](https://github.com/btholath)
