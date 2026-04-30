---
description: Find and run the strongest relevant verification.
agent: verifier
subtask: true
---

Use the `verification-before-completion` skill if available.

Request:

$ARGUMENTS

Identify the relevant checks, run the smallest useful verification first, and
report exact pass/fail results. Do not fix failures unless I explicitly ask.
Do not claim success without evidence.
