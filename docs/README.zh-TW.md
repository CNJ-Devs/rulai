<div align="center">

<img src="./assets/logo.svg" width="300" alt="RulAI logo" />
<br></br>

RulAI —— 開箱即用的 coding agent 互動規則：除錯升級、錯誤熔斷、反思機制，一鍵初始化。

<a href="../README.md">English</a> &nbsp;·&nbsp;
<a href="./README.zh-CN.md">简体中文</a> &nbsp;·&nbsp;
<a href="./README.zh-TW.md">繁體中文</a> &nbsp;·&nbsp;
<a href="./README.ja.md">日本語</a>

</div>

## 為什麼需要這個？

Coding agent 很強，但在實際使用中你是不是經常遇到這些情況：

- bug 反覆修不好，改了 A 又壞了 B
- 盲目執行指令，結果和預期天差地別
- 上下文一丟，之前踩過的坑重新再踩一遍
- 沒有主動的除錯策略，全靠猜

**RulAI** 幫你一鍵初始化一套可自行演進的規則約束，讓你的 AI 協作越用越順手。

## 安裝

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/CNJ-Devs/rulai/master/install.sh)"
```

CLI 會安裝到 `~/.local/bin/rulai`。如果該目錄不在 `PATH` 裡，安裝腳本會提示你新增。

## 使用

```bash
cd your-project
rulai setup      # 互動式初始化規則
```

### 所有命令

| 命令 | 說明 |
|------|------|
| `rulai setup` | 互動式初始化 / 重新配置互動規則 |
| `rulai status` | 查看目前專案的設定和檔案狀態 |
| `rulai update` | 自更新 CLI 到最新版本 |
| `rulai version` | 顯示版本號，並檢查是否有更新 |
| `rulai help` | 顯示說明資訊 |

## 規則一覽

| # | 規則 | 觸發 | 行為 |
|---|------|------|------|
| 1 | 拒絕模糊指令 | 指令有歧義 | 追問確認，不默默猜 |
| 2 | 除錯升級 - 加 log | bug 修 1-2 次沒好 | 建議加 console.log |
| 3 | 錯誤熔斷 | 同方案 3+ 輪 | 停下 → 提替代方案 → 使用者選了再動 |
| 4 | 修復後反思 | bug 修好後 | 總結「應該怎麼問」 |
| 5 | 記錄經驗 | 反思完後 | 寫入 learned lessons |
| 6 | 並行探索 | 新功能起步 | 提方案（含跨 agent 選項） |
| 7 | 文件先行 | 多檔案新功能 | 先寫 implementation plan |

## License

本專案基於 [MIT License](../LICENSE) 開源，詳情請查看 LICENSE 檔案。
