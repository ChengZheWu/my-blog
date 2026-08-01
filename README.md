# Cloud-Native Data-Driven Resume

A modern personal resume website that treats content as code, using a **Single Source of Truth** architecture where all data lives in `data.json`.

這是一個現代化的履歷網站，將「履歷資料」視為程式碼管理，採用 **Single Source of Truth** 架構，所有內容統一由 `data.json` 維護。

## ✨ Features

* **📄 Data-Driven Rendering**: All content (experience, skills, projects) is fetched from a single `data.json` file.
* **⬇️ Dynamic Resume Generation**: JavaScript-powered engine that generates and downloads a formatted HTML/PDF resume from `data.json`.
* **🌍 Bilingual Support**: Seamlessly toggles between **English** and **Traditional Chinese** without page reloads.
* **🔄 Automated Deployment**: A `git push` to `main` automatically deploys to GitHub Pages via GitHub Actions.

## 🛠️ Tech Stack

| Category | Technology |
| --- | --- |
| **Frontend** | HTML5, CSS3, JavaScript (ES6+), JSON |
| **Hosting** | GitHub Pages |
| **CI/CD** | GitHub Actions |

## 🍴 Want to use this as your own resume?

Want to fork this repo and turn it into your own resume site? See [Tutorial.md](Tutorial.md) for a full step-by-step guide (VSCode-based, covers setup and day-to-day updates).

想要 fork 這個 repo 做成你自己的履歷網站嗎？完整步驟教學請見 [Tutorial.md](Tutorial.md)（以 VSCode 操作為主，涵蓋初始設定與日常更新流程）。

## 📜 License

This project is licensed under the [MIT License](LICENSE) — feel free to fork, modify, and use the code for your own resume.

Note: the code (HTML/CSS/JS) is MIT licensed, but the content in `data.json` (name, contact info, work history, etc.) is the author's personal data provided as an example only. It is **not** covered by the license — please replace it with your own information before using this as your resume.

本專案程式碼採 [MIT License](LICENSE) 授權，歡迎自由 fork、修改、拿去做自己的履歷網站。

但 `data.json` 裡的內容（姓名、聯絡方式、工作經歷等）是作者本人的個人資料，僅作為範例展示，**不在授權範圍內**，使用前請務必替換成你自己的資料。

## 👤 Author

**ChengZhe Wu (Andy)**
[GitHub](https://github.com/ChengZheWu) · [LinkedIn](https://linkedin.com/in/chengzhewu)

