---
name: release-skills
description: Release the skills plugin to the marketplace. Use when the user asks to "release the skills", "publish skills", "ship skills", or "update the marketplace".
---

Follow these steps exactly, in order:

1. Run `git status` to identify uncommitted changes.

2. If there are uncommitted changes outside of `.claude-plugin/marketplace.json`, commit them first with an appropriate message. Do not commit `.claude-plugin/marketplace.json` yet — it will be updated in steps 3–5.

3. Run `bash scripts/sync-marketplace-skills.sh` from the repo root to update the skills list in `.claude-plugin/marketplace.json`.

4. Run `git rev-parse HEAD` to get the current HEAD SHA.

5. Update the `commit` field in `.claude-plugin/marketplace.json` to the SHA from step 4.

6. Commit `.claude-plugin/marketplace.json` with the message `"Release: update marketplace commit SHA"` and push.

If there are no uncommitted changes, skip to step 3.
