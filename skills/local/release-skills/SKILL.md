---
name: release-skills
description: Release the skills plugin to the marketplace. Use when the user asks to "release the skills", "publish skills", "ship skills", or "update the marketplace".
---

Follow these steps exactly, in order:

1. Run `git status` to identify uncommitted changes.

2. If there are uncommitted changes outside of `.claude-plugin/plugin.json`, commit them first with an appropriate message. Do not commit `.claude-plugin/plugin.json` yet — it will be updated in step 3.

3. Run `bash scripts/sync-plugin-config.sh` from the repo root to update the skills list in `.claude-plugin/plugin.json`.

4. Commit `.claude-plugin/plugin.json` with the message `"Release: sync plugin skills config"` and push.

If there are no uncommitted changes, skip to step 3.
