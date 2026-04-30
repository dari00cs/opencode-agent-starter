# OpenCode Agent Starter

A clean starter repo for using OpenCode with a few strong habits and a small
set of useful skills.

- read the repo before changing it
- plan before risky edits
- use focused subagents
- load real skills instead of repeating long prompts
- verify before calling work done

This repo is intentionally small and project-local. It gives OpenCode a clear
behavior contract, focused agents, daily commands, and a curated skill set that
a beginner can inspect before using.

## What's Included

- `AGENTS.md`: the main behavior contract
- `CLAUDE.md`: Claude Code bridge that imports `AGENTS.md`
- `opencode.jsonc`: project instructions and beginner-safe permissions
- `.opencode/agents/`: focused subagents
- `.opencode/commands/`: daily shortcut commands
- `.opencode/skills/`: Superpowers plus frontend/taste skills
- `.opencode/skills/_groups/`: human-friendly skill group guides
- `docs/skill-index.md`: grouped skill routing guide
- `extras/`: optional tool-dependent workflows that are not loaded by default

## Quick Start

Use this as a template repo, or copy the setup into an existing project.

For a new sandbox project:

```bash
git clone https://github.com/dari00cs/opencode-agent-starter.git
cd opencode-agent-starter
opencode
```

For an existing project, copy these into the project root:

```text
AGENTS.md
CLAUDE.md
START-HERE.md
opencode.jsonc
.opencode/
docs/skill-index.md
extras/
```

If the project already has `AGENTS.md`, `opencode.jsonc`, `.opencode/`, or
`CLAUDE.md`, merge the ideas instead of blindly overwriting them.

## Verify It Loaded

From the project root, start OpenCode and check:

- type `/` and look for `/plan`, `/debug`, `/frontend`, `/review`, `/verify`, `/ship`
- type `@` and look for `@explorer`, `@builder`, `@reviewer`, `@researcher`, `@ux-review`, `@verifier`
- ask: `Read AGENTS.md and START-HERE.md. Which skill would you use first?`

## Skills

OpenCode discovers skills from flat folders like
`.opencode/skills/<skill-name>/SKILL.md`. The folders stay flat on purpose.
Use `.opencode/skills/_groups/` or `docs/skill-index.md` for grouped routing.

Start with:

- `using-superpowers`
- `systematic-debugging`
- `verification-before-completion`
- `frontend-skill`
- `taste-skill`
- `react-best-practices`

Optional advanced skills are included, but a beginner does not need to learn
them all on day one. Start with the daily loop, then add new tools only when a
real project workflow needs them.

Human-friendly groups:

- `.opencode/skills/_groups/start-here.md`
- `.opencode/skills/_groups/superpowers.md`
- `.opencode/skills/_groups/frontend-and-taste.md`
- `.opencode/skills/_groups/advanced-and-optional.md`

## First Prompt

```text
Read AGENTS.md and START-HERE.md first. Then tell me which skill or subagent
you would use for my task before making changes.
```

## Useful Commands

- `/plan`
- `/debug`
- `/frontend`
- `/review`
- `/verify`
- `/ship`

`/review` is a custom command here. It does not conflict with the documented
OpenCode built-ins: `/init`, `/undo`, `/redo`, `/share`, and `/help`.

## Philosophy

Keep the repo easy to read, but do not flatten the included skills into vague
summaries. When a skill applies, the agent should read the actual `SKILL.md`
and follow it.
