That's the Claude Code `/model` picker. Here's what each option means for your CCAF lab work:

**For your study lab, here's how to choose:**

| Model | Best For in Your Lab | Usage Cost |
|---|---|---|
| **Sonnet 4.6** (Default) | Day-to-day coding, iterating on Python files, quick edits | 1× |
| **Fable 5** | Long agentic runs, complex multi-agent orchestration (Domain 1 capstone) | ~2× |
| **Opus 4.8** | Hardest tasks — writing MCP server logic, debugging tricky agentic loops | ~2× |
| **Haiku 4.5** | Fast lookups, simple questions, checking syntax | Fastest |

**Practical recommendation for your lab:**

- Stick with **Sonnet 4.6 (Default)** for 90% of your work — editing files, running `/annuity-report`, asking questions about your code.
- Switch to **Opus** (`s` for session-only) when you tackle the capstone `advisor.py` or the hub-and-spoke orchestrator — those benefit from stronger reasoning.
- Use **Haiku** when you just want a quick answer ("what does this error mean?") and don't want to burn usage.

**Exam relevance:** Domain 3 tests your knowledge of Claude Code configuration, and model selection is part of that. The key concept is that the model choice is separate from your API calls — your Python scripts in the lab specify `claude-opus-4-5` directly in `client.messages.create(model=...)`, independent of what Claude Code itself is running on.

Press `1` + Enter to confirm Sonnet as default and you're good to go.