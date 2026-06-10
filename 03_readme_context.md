❯ /model  
 ⎿ Set model to Sonnet 4.6 (default) and saved as your default for new sessions

❯ /context
⎿ Context Usage
⛁ ⛁ ⛁ ⛁ ⛁ ⛁ ⛁ ⛀ ⛀ ⛀ Sonnet 4.6
⛁ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ claude-sonnet-4-6
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ 18.3k/200k tokens (9%)
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ Estimated usage by category
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛁ System prompt: 6.4k tokens (3.2%)
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛁ System tools: 9.1k tokens (4.6%)
⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛁ Memory files: 118 tokens (0.1%)
⛶ ⛶ ⛶ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛁ Skills: 1.1k tokens (0.5%)
⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛁ Messages: 1.6k tokens (0.8%)
⛶ Free space: 148.7k (74.3%)
⛝ Autocompact buffer: 33k tokens (16.5%)

     Auto-compact window: 200k tokens

     MCP tools · /mcp (loaded on-demand)

     Available
     ├ mcp__ide__executeCode
     ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶   ⛁ System tools: 9.1k tokens (4.6%)
     ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶ ⛶   ⛁ Memory files: 118 tokens (0.1%)
     ⛶ ⛶ ⛶ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝   ⛁ Skills: 1.1k tokens (0.5%)
     ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝ ⛝   ⛁ Messages: 1.6k tokens (0.8%)
                           ⛶ Free space: 148.7k (74.3%)
                           ⛝ Autocompact buffer: 33k tokens (16.5%)

     Auto-compact window: 200k tokens

     MCP tools · /mcp (loaded on-demand)

     Available
     ├ mcp__ide__executeCode
     └ mcp__ide__getDiagnostics

     Memory files · /memory
     └ CLAUDE.md: 118 tokens

     Skills · /skills

     Built-in
     ├ claude-api: ~270 tokens
     ├ update-config: ~180 tokens
     ├ code-review: ~100 tokens
     ├ schedule: ~90 tokens
     ├ run: ~90 tokens
     ├ loop: ~90 tokens
     ├ verify: ~60 tokens
     ├ keybindings-help: ~60 tokens
     ├ fewer-permission-prompts: ~50 tokens
     ├ simplify: ~50 tokens
     ├ security-review: ~20 tokens
     ├ init: < 20 tokens
     └ review: < 20 tokens

──────────────────────────────────────────────────────────────────────────────────
❯
──────────────────────────────────────────────────────────────────────────────────
? for shortcuts · ← for agents ⧉ In 02_readme_choose_ai_model.md

This is a goldmine for **Domain 3 and Domain 5** exam prep. Let me break down exactly what you're seeing:

---

## `/context` Output Decoded

### Token Budget (Domain 5 — Context Management)

```
18.3k / 200k tokens used (9%)  ← you have enormous headroom right now
```

| Category           | Tokens     | What It Is                                          |
| ------------------ | ---------- | --------------------------------------------------- |
| System prompt      | 6.4k       | Claude Code's built-in instructions                 |
| System tools       | 9.1k       | Built-in tool definitions (bash, read, write, etc.) |
| Memory files       | 118        | Your `CLAUDE.md` — tiny and efficient ✅            |
| Skills             | 1.1k       | Built-in skills loaded                              |
| Messages           | 1.6k       | Your conversation so far                            |
| **Free space**     | **148.7k** | Available for your code, files, outputs             |
| Autocompact buffer | 33k        | Reserved for auto-summarisation trigger             |

**Exam concept:** The autocompact buffer is Claude Code's implementation of the _sliding window_ pattern from Domain 5. When context fills up, it auto-summarises older turns into that 33k buffer rather than crashing.

---

### MCP Tools (Domain 2 — MCP Integration)

```
mcp__ide__executeCode
mcp__ide__getDiagnostics
```

These are VS Code's built-in MCP server tools — loaded on-demand. This is **SSE transport** in action: VS Code runs an MCP server, Claude Code connects as a client. This is exactly the architecture you'll build in `domain2_mcp_integration/03_sse_transport/`.

---

### Skills (Domain 3 — Claude Code Config)

The built-in skills you can call directly:

| Skill             | Use in Your Lab                           |
| ----------------- | ----------------------------------------- |
| `claude-api`      | Ask about API patterns                    |
| `code-review`     | `/review` a domain file before running it |
| `loop`            | Run agentic loops — relevant to Domain 1  |
| `verify`          | Check your code output is correct         |
| `security-review` | Scan for hardcoded API keys               |

---

### Memory Files (Domain 3 — CLAUDE.md)

```
└ CLAUDE.md: 118 tokens
```

Your root `CLAUDE.md` is loaded and active. At only 118 tokens it's efficient. **Exam rule:** keep CLAUDE.md files under 500 tokens each — they consume context on every turn.

---

## What to Do Right Now

```bash
# Check what your CLAUDE.md looks like to Claude Code
/memory

# See all available slash commands including your custom one
/help

# Run your first domain file
python domain1_agentic_architecture/01_single_agent/agent.py
```

The context window is at 9% — perfect time to start a long agentic session.
