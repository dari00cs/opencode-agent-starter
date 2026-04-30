# Start Here

Use this prompt first inside any project that has this setup:

```text
Read AGENTS.md and START-HERE.md first. Then tell me which skill or subagent
you would use for my task before making changes.
```

## Simple Loop

1. Ask the agent to inspect the repo.
2. Ask for a short plan.
3. Let it make the smallest useful change.
4. Make it run a real check.
5. Ask what changed and what is still uncertain.

## Main Pieces

- `AGENTS.md`: main behavior rules.
- `.opencode/agents/`: focused helpers.
- `skills/`: grouped skill library for humans.
- `.opencode/skills/`: flat OpenCode compatibility mirror.
- `.opencode/commands/`: shortcut prompts.
- `docs/skill-index.md`: grouped skill routing guide.

## First Commands

- `/plan what you want`
- `/debug the error`
- `/frontend the UI request`
- `/review the diff`
- `/verify the work`
- `/ship the final check`

Start with the project-local files in this repo. Add new tools later when a
real workflow repeats enough to justify reusable setup.

## Beginner Defaults

- Use `/plan` before multi-file work.
- Use `/debug` for errors or failing tests.
- Use `/frontend` for UI work.
- Use `/review` before merging or sharing a change.
- Use `/verify` when work looks done.

For frontend work, start with `frontend-skill`, `taste-skill`,
`react-best-practices`, and `shadcn` when relevant. Tool-dependent concept
workflows live under `extras/` and are not loaded by default.

When the skill list feels confusing, open `skills/README.md` first.
