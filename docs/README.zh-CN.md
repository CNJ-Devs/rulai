<div align="center">

<img src="./assets/logo.svg" width="300" alt="RulAI logo" />
<br>

RulAI —— 开箱即用的 coding agent 交互规则：调试升级、错误熔断、反思机制，一键初始化。

<a href="../README.md">English</a> &nbsp;·&nbsp;
<a href="./README.zh-CN.md">简体中文</a> &nbsp;·&nbsp;
<a href="./README.zh-TW.md">繁體中文</a> &nbsp;·&nbsp;
<a href="./README.ja.md">日本語</a>

</div>

## 为什么需要这个？

Coding agent 很强，但在实际使用中你是不是经常遇到这些情况：

- bug 反复修不好，改了 A 又坏了 B
- 盲目执行指令，结果和预期天差地别
- 上下文一丢，之前踩过的坑重新再踩一遍
- 没有主动的调试策略，全靠猜

**RulAI** 帮你一键初始化一套可自行演进的规则约束，让你的 AI 协作越用越顺手。

## 安装

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/CNJ-Devs/rulai/main/install.sh)"
```

CLI 会安装到 `~/.local/bin/rulai`。如果该目录不在 `PATH` 里，安装脚本会提示你添加。

## 使用

```bash
cd your-project
rulai setup      # 交互式初始化规则
```

### 所有命令

| 命令 | 说明 |
|------|------|
| `rulai setup` | 交互式初始化 / 重新配置交互规则 |
| `rulai status` | 查看当前项目的配置和文件状态 |
| `rulai update` | 自更新 CLI 到最新版本 |
| `rulai version` | 显示版本号，并检查是否有更新 |
| `rulai help` | 显示帮助信息 |

## 规则一览

| # | 规则 | 触发 | 行为 |
|---|------|------|------|
| 1 | 拒绝模糊指令 | 指令有歧义 | 追问确认，不默默猜 |
| 2 | 调试升级 - 加 log | bug 修 1-2 次没好 | 建议加 console.log |
| 3 | 错误熔断 | 同方案 3+ 轮 | 停下 → 提替代方案 → 用户选了再动 |
| 4 | 修复后反思 | bug 修好后 | 总结"应该怎么问" |
| 5 | 记录经验 | 反思完后 | 写入 learned lessons |
| 6 | 并行探索 | 新功能起步 | 提方案（含跨 agent 选项） |
| 7 | 文档先行 | 多文件新功能 | 先写 implementation plan |

## License

本项目基于 [MIT License](../LICENSE) 开源，详情请查看 LICENSE 文件。
