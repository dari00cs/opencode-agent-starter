# Skill Index

Readable skills live in grouped folders under `skills/`. OpenCode discovers
skills from flat folders, so run `./scripts/sync-opencode-skills.sh` to generate
the local `.opencode/skills/<skill-name>/SKILL.md` import folders.

Human groups:

- `skills/superpowers/`
- `skills/frontend-and-taste/`
- `skills/react-and-components/`
- `skills/advanced-and-optional/`

## Start With These

- `using-superpowers`: first skill for non-trivial work.
- `systematic-debugging`: bugs, errors, failing tests, and weird behavior.
- `verification-before-completion`: before saying work is done.
- `frontend-skill`: default frontend/UI quality bar.
- `taste-skill`: default premium frontend taste layer.
- `react-best-practices`: React and Next.js reliability/performance.

## Daily Workflow

- `/plan`: inspect and make a short plan before edits.
- `/debug`: find root cause before fixing.
- `/frontend`: route UI work to the safe frontend skills.
- `/review`: read-only review for bugs, regressions, privacy, and missing
  verification.
- `/verify`: read-only verification pass.
- `/ship`: final skeptical handoff check.

## Superpowers

- `using-superpowers`
- `executing-plans`
- `systematic-debugging`
- `test-driven-development`
- `verification-before-completion`
- `requesting-code-review`
- `receiving-code-review`
- `brainstorming`
- `writing-plans`
- `subagent-driven-development`
- `dispatching-parallel-agents`
- `finishing-a-development-branch`
- `using-git-worktrees`
- `writing-skills`

## Frontend Defaults

- `frontend-skill`
- `taste-skill`
- `redesign-skill`
- `gpt-tasteskill`
- `minimalist-skill`
- `soft-skill`
- `brutalist-skill`

## React And Components

- `react-best-practices`
- `shadcn`

## Optional Tool-Dependent Skills

- `stitch-skill`

Tool-dependent concept workflows are kept under `extras/` instead of the active
OpenCode skill folder.

## Sync For OpenCode

Run this after cloning, copying, or editing grouped skills:

```bash
./scripts/sync-opencode-skills.sh
./scripts/sync-opencode-skills.sh --check
```

The generated `.opencode/skills/` folders are ignored by git. Keep editing
`skills/`.

## Adding More Later

Keep this starter readable. Add a new skill, command, or agent when a project
workflow repeats enough that reusable instructions would make the agent more
reliable.
