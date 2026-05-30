# Good Vibrations - Product Development

A Claude Code skills marketplace plugin to aid in software product development.

## Structure

```
.claude-plugin/
└── plugin.json             # Plugin manifest (required)
skills/
└── <group>/                # Logical grouping (e.g. planning, engineering, qa)
    └── <skill-name>/
        └── SKILL.md        # Skill definition
```

Skills are discovered recursively, so nesting can go as deep as needed.

## Adding Skills

Create a `SKILL.md` inside any subdirectory under `skills/`:

```
skills/
└── engineering/
    └── code-review/
        └── SKILL.md
```

`SKILL.md` requires this frontmatter:

```markdown
---
name: skill-name
description: This skill should be used when...
version: 1.0.0
---
```

Each skill is registered as `jamescauwelier-skills:<skill-name>` in Claude Code.

## Installation

```
/plugin install jamescauwelier-skills@<marketplace>
```

## Credits

Some skills are copies or started as copies of skills in [Matt Pocock](https://github.com/mattpocock/skills/commits?author=mattpocock) 's [skill library](https://github.com/mattpocock/skills). 