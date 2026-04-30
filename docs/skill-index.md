# Skill Index

The actual skills live in flat OpenCode folders:
`.opencode/skills/<skill-name>/SKILL.md`.

Do not nest the skill folders by category. OpenCode discovers them from the
flat folder layout. This file is the human-friendly grouping.

## Start With These

- `using-superpowers`: first skill for non-trivial work; teaches the agent to
  load skills instead of guessing.
- `systematic-debugging`: use for bugs, errors, failing tests, and weird
  behavior.
- `verification-before-completion`: use before saying work is done.
- `frontend-skill`: default frontend/UI quality bar.
- `taste-skill`: default premium frontend taste layer.
- `react-best-practices`: React and Next.js performance/reliability guidance.

## Daily Workflow

- `/plan`: inspect and make a short plan before edits.
- `/debug`: find root cause before fixing.
- `/frontend`: route UI work to the safe frontend skills.
- `/review`: read-only review for bugs, regressions, privacy, and missing
  verification.
- `/verify`: read-only verification pass.
- `/ship`: final skeptical handoff check.

## Superpowers Core

- `using-superpowers`
- `executing-plans`
- `systematic-debugging`
- `test-driven-development`
- `verification-before-completion`
- `requesting-code-review`
- `receiving-code-review`

## Superpowers Planning

- `brainstorming`: large or creative work where intent needs shaping. This can
  create design docs, so do not use it for tiny edits.
- `writing-plans`: turn approved requirements into a detailed implementation
  plan.

## Superpowers Advanced

- `subagent-driven-development`
- `dispatching-parallel-agents`
- `finishing-a-development-branch`
- `using-git-worktrees`
- `writing-skills`

## Frontend Defaults

- `frontend-skill`
- `taste-skill`
- `react-best-practices`
- `shadcn`
- `redesign-skill`

## Optional Style Flavors

- `gpt-tasteskill`
- `minimalist-skill`
- `soft-skill`
- `brutalist-skill`

Use these only when the user clearly asks for that direction. Otherwise default
to `taste-skill`.

## Optional Tool-Dependent Skills

- `stitch-skill`

Tool-dependent concept workflows are kept under `extras/` instead of the active
OpenCode skill folder. Bring them in only after the project has the required
tools.

## Adding More Later

Keep this starter readable. Add a new skill, command, or agent when a project
workflow repeats enough that reusable instructions would make the agent more
reliable.
