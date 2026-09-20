# deal-with-the-devil (Antigravity CLI Edition)

![mascot](image.png)

A native `.agents/` setup that helps **Antigravity CLI (`agy`)** write code like a careful engineer instead of a fast one. Works in any project, whatever the language or stack.

> [!IMPORTANT]
> **Credits & Original Attribution**:
> This project is an adaptation of the original [`claude-deal-with-the-devil`](https://github.com/dlesieur) created by **dlesieur**. All credit for the underlying philosophy, risk tribunal concept ("the devil"), TDD loop discipline, and tool pre-digestion architecture belongs to **dlesieur**.

---

## Why this exists

AI models write code quickly, but a fast, confident answer to an unthought-through decision is often wrong in ways that look plausible.

This config pushes back on that by enforcing evidence before action and establishing explicit quality gates:

- **Guessing instead of looking.** Helper scripts pre-digest the codebase so the agent works from structured facts (`.agents/tools/digest.sh`).
- **Rushing risky decisions.** The `devil` skill pressure-tests risky plans and pronounces a verdict (**BLOCK** or **PROCEED**) *before* code is written.
- **Reinventing things.** A "reuse first" discipline (`library-first`) and duplicate scanner keep code minimal.
- **"Looks done."** A strict quality gate (`.agents/tools/quality.sh`) is the unit of "done".

---

## How a task flows

```
prompt skill       →   deal skill      →   builder persona       →   quality skill
write a spec           the devil           test-first, reuse         run the strict gate
                       decides go/stop     red → green → refactor
```

1. **`prompt` skill** — turns a vague user prompt into a precise spec with a verifiable "done-when".
2. **`deal` skill** — sends risky plans to the `devil` magistrate (scoring blast radius, reversibility, cost, and confidence).
3. **`builder` persona** — builds the primitive first, writes the failing test (RED), passes with minimal code (GREEN), then cleans up (REFACTOR).
4. **`quality` skill** — runs strict checks (formatting, linting, types, security scans, dependency audits).

---

## Structure

```text
.agents/
├── AGENTS.md                  Multi-agent discipline & agent personas
├── hooks.json                 Lifecycle event hooks (auto-preflight)
├── skills/                    13 native skills (prompt, deal, quality, refactor, etc.)
│   ├── prompt/SKILL.md
│   ├── quality/SKILL.md
│   ├── refactor/SKILL.md
│   ├── bench/SKILL.md
│   ├── compat/SKILL.md
│   ├── migrate/SKILL.md
│   ├── deal/SKILL.md
│   ├── ship/SKILL.md
│   ├── onboard-app/SKILL.md
│   ├── compat-audit/SKILL.md
│   ├── migrate-db/SKILL.md
│   ├── api-endpoint/SKILL.md
│   └── write-test/SKILL.md
└── tools/                     Bash parsing layer (digest, quality, facts, watch, etc.)
    ├── lib/common.sh
    └── README.md
GEMINI.md                      Consolidated rules (risk, quality, TDD, DSA, stack rules)
```

---

## Quick Start for Antigravity Users

1. Copy `GEMINI.md` and `.agents/` into your project root.
2. Run `.agents/tools/digest.sh` to see stack facts, untested areas, and code maps.
3. Interact naturally with `agy` using trigger phrases:
   - *"write a spec for..."* → triggers `prompt` skill
   - *"is this plan safe?"* / *"deal with the devil"* → triggers `deal` skill
   - *"run quality"* / *"check quality"* → triggers `quality` skill
   - *"deep refactor this file"* → triggers `refactor` skill

---

## License & Attribution

- **Original Author**: [dlesieur](https://github.com/dlesieur)
- **License**: MIT License (see [LICENSE](LICENSE))
