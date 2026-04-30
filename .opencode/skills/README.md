# Generated OpenCode Skill Folder

This folder is the local OpenCode import target.

The repo only tracks this README here. The readable skill source lives in
`../../skills/`, grouped by purpose.

Run this from the repo root before starting OpenCode:

```bash
./scripts/sync-opencode-skills.sh
```

That creates real flat folders like `.opencode/skills/<skill-name>/SKILL.md`
from the grouped source. Generated skill folders are ignored by git.

Edit the grouped source folders, then run the sync script again.
