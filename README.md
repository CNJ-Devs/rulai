<div align="center">

<img src="docs/assets/logo.svg" width="300" alt="RulAI logo" />
<br></br>

RulAI — Out-of-the-box interaction rules for coding agents: debug escalation, error circuit-breaking, reflection, and more.

<a href="./README.md">English</a> &nbsp;·&nbsp;
<a href="./docs/README.zh-CN.md">简体中文</a> &nbsp;·&nbsp;
<a href="./docs/README.zh-TW.md">繁體中文</a> &nbsp;·&nbsp;
<a href="./docs/README.ja.md">日本語</a>

</div>

## Why RulAI?

Coding agents are powerful, but you've probably run into these issues:

- Bugs go in circles — fix A, break B
- Blindly follows instructions — results are miles from expectations
- Context is lost — same mistakes get repeated over and over
- No proactive debugging strategy — pure guesswork

**RulAI** bootstraps a self-evolving set of interaction rules so your AI collaboration gets better over time.

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/CNJ-Devs/rulai/main/install.sh)"
```

The CLI installs to `~/.local/bin/rulai`. If that directory isn't in your `PATH`, the installer will prompt you to add it.

## Usage

```bash
cd your-project
rulai setup      # Interactive rule initialization
```

### All Commands

| Command | Description |
|---------|-------------|
| `rulai setup` | Interactively initialize / reconfigure interaction rules |
| `rulai status` | Show current project config and file status |
| `rulai update` | Self-update the CLI to the latest version |
| `rulai version` | Show version and check for updates |
| `rulai help` | Show help |

## Rules at a Glance

| # | Rule | Trigger | Behavior |
|---|------|---------|----------|
| 1 | Reject vague instructions | Ambiguous instructions | Ask to clarify, never guess silently |
| 2 | Debug escalation | Bug not fixed after 1–2 attempts | Suggest adding console.log |
| 3 | Error circuit-breaking | Same approach 3+ rounds | Stop → propose alternatives → act on user's choice |
| 4 | Post-fix reflection | After a bug is fixed | Summarize "how should I have asked" |
| 5 | Record lessons | After reflection | Write to learned lessons file |
| 6 | Parallel exploration | Starting a new feature | Propose approaches (incl. cross-agent option) |
| 7 | Docs first | Multi-file new feature | Write implementation plan first |

## License

This project is open-sourced under the [MIT License](LICENSE).
