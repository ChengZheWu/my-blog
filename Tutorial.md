# 複製這個履歷網站來用 —— VSCode 操作教學

這份教學教你怎麼用這個 repo 做出「屬於你自己」的履歷網站，全程用 VSCode 操作（含 Git），不需要打指令。

分成兩部分：

* **一、設定**：只需要做一次的事（Clone、網域設定）
* **二、使用**：以後每次要更新履歷內容時，重複做的事（改資料、Commit、Push、檢查有沒有部署成功）

---

# 一、設定（只需要做一次）

## 0. 前置準備

* 一個 GitHub 帳號
* 電腦上安裝好 [VSCode](https://code.visualstudio.com/)
* VSCode 內建的 Git 功能就夠用了，不需要額外裝 GitHub 擴充套件（但裝了操作會更方便，非必要）

## 1. Fork 這個 Repo

先用瀏覽器打開原本的 repo 頁面，點右上角 **Fork**，把它複製一份到你自己的 GitHub 帳號底下。
（用 Fork 而不是單純 Clone 的原因：Fork 之後你會有一個「屬於你自己的 repo」，裡面已經包含自動部署用的 GitHub Actions 設定，之後直接 push 就能用。）

## 2. 用 VSCode Clone 下來

1. 打開 VSCode
2. 按 `Ctrl+Shift+P`（Mac 是 `Cmd+Shift+P`）打開命令面板
3. 輸入並選擇 **Git: Clone**
4. 貼上你剛剛 fork 出來、屬於你帳號的 repo 網址（例如 `https://github.com/你的帳號/my-resume.git`）
5. 選一個資料夾存放，Clone 完成後點 **Open** 打開這個專案

## 3. 開啟 GitHub Pages

這步是在 GitHub 網頁上設定，不是在 VSCode：

1. 到你 fork 出來的 repo 頁面 → **Settings** → 左側選單 **Pages**
2. 在 **Build and deployment → Source** 選擇 **GitHub Actions**
3. 存檔即可，之後每次 push 都會自動觸發部署（部署流程怎麼看，在「二、使用」有寫）

## 4. 網域設定 —— 有沒有自己的網域，差在這裡

專案根目錄有一個 **[CNAME](CNAME)** 檔案，這個檔案決定網站要用什麼網址。

### 情況 A：沒有自訂網域（直接用 GitHub 預設網址）

1. 在 VSCode 裡找到 `CNAME` 檔案，直接刪除
2. 存檔後照「二、使用」的步驟 Commit + Push 一次
3. 之後網站網址就會是：

   ```
   https://你的帳號.github.io/repo名稱/
   ```

### 情況 B：有自己買的網域

1. 把 `CNAME` 檔案內容改成你自己的網域（例如 `yourdomain.com`），存檔
2. 到你買網域的地方（GoDaddy、Cloudflare、namecheap…）設定 DNS，指向 GitHub Pages
3. 回到 GitHub repo 的 Settings → Pages，確認 Custom domain 欄位顯示你的網域，並確認驗證通過

   > 這部分細節依網域商而異，這裡不展開，有需要可以再問。

設定到這裡就完成了，之後就是進入「二、使用」的日常流程。

---

# 二、使用（以後每次要更新履歷內容）

## 1. 修改內容

### 1-1 履歷內容 → `data.json`

這個網站的所有文字內容（姓名、經歷、技能、專案…）都集中在 [data.json](data.json) 這一個檔案裡，每個欄位都有 `zh`（中文）跟 `en`（英文）兩個版本，直接在 VSCode 打開來改：

```json
"profile": {
  "name": { "zh": "你的名字", "en": "Your Name" },
  "mobile": { "zh": "手機", "en": "Mobile", "val": "你的電話" },
  "email": "你的信箱",
  "social": {
    "linkedin": "你的 LinkedIn 連結",
    "github": "你的 GitHub 連結"
  }
}
```

其他區塊（`about`、`experience`、`education`、`skills`、`projects`…）照同樣的結構改就好，用 VSCode 的**搜尋 (Ctrl+Shift+F)** 可以快速找到要改的地方。

### 1-2 網頁標題 → `index.html`

打開 [index.html](index.html)，把瀏覽器分頁標題改成你自己的名字：

```html
<title>ChengZhe Wu (Andy) - Resume</title>
```

### 1-3 本機預覽（可選）

改完想先看看效果，在 VSCode 打開 Terminal（選單 Terminal → New Terminal），輸入：

```bash
python3 -m http.server 8080
```

然後瀏覽器開 `http://localhost:8080` 就能看到目前的樣子。
（沒有 Python 也可以裝 VSCode 的 **Live Server** 擴充套件，右鍵 `index.html` 選 "Open with Live Server"。）

## 2. Commit & Push

1. 點左側的 **Source Control** 圖示（分支圖案，或按 `Ctrl+Shift+G`）
2. 會看到你修改過的檔案列表，點檔案旁的 `+` 把它們加入暫存區（Stage），或直接點上方的 `+` 全部加入
3. 在上面的訊息欄位輸入 commit 訊息，例如 `更新履歷資料`
4. 按 `Ctrl+Enter` 或點 **Commit** 完成提交
5. 點下方的 **Sync Changes / Push** 把變更推上你的 GitHub repo

## 4. 檢查 GitHub Actions 有沒有部署成功

1. 到你的 repo 頁面 → 點上方 **Actions** 頁籤
2. 會看到一個以你的 commit 訊息命名的流程正在跑（黃色圓圈 = 進行中）
3. 等它變成綠色勾勾，代表部署完成；如果是紅色叉叉，點進去看 log 找錯誤原因

## 5. 打開網頁看更新 —— 如果沒看到最新內容怎麼辦

Actions 顯示成功了，但瀏覽器打開網站還是舊的畫面，通常是**瀏覽器快取**的問題，不是部署失敗。手動強制重新整理即可：

* Windows / Linux：`Ctrl+Shift+R`
* Mac：`Cmd+Shift+R`

如果還是沒更新，可以換無痕視窗開一次網址確認，或是稍等 1～2 分鐘再重新整理（GitHub Pages 的 CDN 快取偶爾需要一點時間才會全球同步）。

## 6. 下載成 PDF 履歷

網站上有一個 **Download HTML** 按鈕，點下去會產生一份格式化好的 HTML 履歷檔案（下載到瀏覽器的下載資料夾）。要轉成 PDF：

1. 打開剛剛下載的那個 HTML 檔案（用瀏覽器開）
2. 按 `Ctrl+P`（Mac 是 `Cmd+P`）叫出列印視窗
3. **Destination** 選 **Save as PDF**，按 Save 存檔即可

> 小提醒：列印視窗會有一個 **More settings** 選項，裡面的 **Headers and footers** 預設是打開的，會在 PDF 上下多印出日期時間、網址、頁碼這些東西。這不是網站產生的內容，是瀏覽器列印功能內建的頁首頁尾，把這個選項取消勾選就會消失。
