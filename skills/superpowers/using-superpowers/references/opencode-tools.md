# OpenCode Tool Mapping

Use this reference when a Superpowers skill mentions Claude Code or generic agent-tool names.

## Core Mapping

| Skill says | In OpenCode, use |
| --- | --- |
| `Skill` tool | Native `skill` tool with the skill name |
| `Task` tool | A project subagent via `@agent-name`, or a command with `agent:` / `subtask:` |
| `TodoWrite` | OpenCode todo tool when available; otherwise keep a short checklist in the main response |
| `Read`, `Write`, `Edit` | OpenCode file tools, respecting project permissions |
| `Bash` | OpenCode shell tool, respecting project permissions |
| Named code-reviewer agent | Use this repo's `@reviewer` agent unless the skill names a more specific local agent |

## Project Agents

This starter includes these project agents:

- `@explorer`: read-only codebase mapping
- `@builder`: scoped implementation after the plan is clear
- `@reviewer`: read-only code and verification review
- `@researcher`: external docs/current-source research
- `@ux-review`: UI, mobile, accessibility, and copy review
- `@verifier`: read-only verification planning and result checking

Use subagents for bounded work. Keep final synthesis, tradeoffs, and user-facing decisions in the main session.

## Review Flow

When a skill asks for a code-reviewer subagent:

1. Gather the scope, intent, and diff or files to review.
2. Invoke `@reviewer` with read-only instructions.
3. Ask for findings first, ordered by severity.
4. Filter the result in the main session before acting.

## Planning Flow

For small tasks, use `/plan` or a short in-chat checklist. For larger features, use `writing-plans` and save the plan under `docs/superpowers/plans/` if the project wants durable planning docs.

## Safety Defaults

- Do not print secret values. Report only whether a value is set.
- Do not run destructive commands without explicit user approval.
- Do not read or write outside the current worktree without approval.
- If a required tool is unavailable, say so and choose the closest OpenCode-safe path.
