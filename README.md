<p align="center">
  <img src="docs/assets/logo.svg" width="160" alt="claude-rules logo" />
</p>

<h1 align="center">claude-rules</h1>

<p align="center">
  一键为任何项目初始化 Claude Code 交互规则 —— 调试升级、卡住处理、反思机制等，开箱即用。
</p>

<p align="center">
  <a href="#安装">安装</a> &nbsp;·&nbsp;
  <a href="#使用">使用</a> &nbsp;·&nbsp;
  <a href="#规则一览">规则一览</a> &nbsp;·&nbsp;
  <a href="LICENSE">MIT License</a>
</p>

## 为什么需要这个？

Claude Code 很强，但没有明确的协作规则时容易：

- 遇到 bug 反复猜，不主动加 log
- 卡住了还在死磕，不知道该换方向
- 修完 bug 不做反思，同类问题反复踩坑

**claude-rules** 用一条命令生成一套经过实战验证的交互规则，写入项目的 `CLAUDE.md`，每个 session 自动生效。

## 规则一览

| # | 规则 | 触发 | 行为 |
|---|------|------|------|
| 1 | 拒绝模糊指令 | 指令有歧义 | 追问确认，不默默猜 |
| 2 | 调试升级 - 加 log | bug 修 1-2 次没好 | 建议加 console.log |
| 3 | 卡住升级 | 同方案 3+ 轮 | 停下 → 提替代方案 → 用户选了再动 |
| 4 | 修复后反思 | bug 修好后 | 总结"应该怎么问" |
| 5 | 记录经验 | 反思完后 | 写入 learned lessons |
| 6 | 并行探索 | 新功能起步 | 提方案（含跨 agent 选项） |
| 7 | 文档先行 | 多文件新功能 | 先写 implementation plan |

## 安装

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JiahaoZhu11/claude-rules/main/install.sh)"
```

CLI 会安装到 `~/.local/bin/claude-rules`。如果该目录不在 `PATH` 里，安装脚本会提示你添加。

## 使用

```bash
cd your-project
claude-rules setup      # 交互式初始化规则
```

### 所有命令

| 命令 | 说明 |
|------|------|
| `claude-rules setup` | 交互式初始化 / 重新配置交互规则 |
| `claude-rules status` | 查看当前项目的配置和文件状态 |
| `claude-rules update` | 自更新 CLI 到最新版本 |
| `claude-rules version` | 显示版本号，并检查是否有更新 |
| `claude-rules help` | 显示帮助信息 |

### setup 流程

1. 检查当前目录是否是 git 仓库（不是会警告并询问是否继续）
2. 交互式配置：规则文件路径、CLAUDE.md 路径、经验记录路径、架构文档（可选）
3. 生成规则文件，注入 `CLAUDE.md` 引用，创建经验记录文件
4. 如果检测到已有配置，每一步会显示当前值作为默认，按 Enter 保留

## 项目结构

```
├── bin/claude-rules    # CLI 本体（安装后放到 ~/.local/bin/）
├── install.sh          # 安装入口
├── VERSION             # 远程版本号（self-update 用）
└── LICENSE             # MIT
```

## 环境变量

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `CLAUDE_RULES_REMOTE` | 自定义远程仓库地址 | `https://raw.githubusercontent.com/JiahaoZhu11/claude-rules/main` |
| `CLAUDE_RULES_HOME` | 自定义安装目录 | `~/.local/bin` |

## License

[MIT](LICENSE) &copy; Jiahao Zhu
