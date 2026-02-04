# Cloud-Native Data-Driven Resume

**Cloud-Native Data-Driven Resume** is a modern personal website project designed to demonstrate full-stack DevOps capabilities. Unlike traditional static sites, this project treats "resume data" as code, utilizing a **Single Source of Truth** architecture to ensure consistency across web views and downloadable formats.

The infrastructure is built from scratch using **Terraform** on **Hetzner Cloud**, orchestrated by **K3s (Kubernetes)**, and fully automated via **GitHub Actions**. It serves as a practical showcase of Infrastructure as Code (IaC), containerization, and CI/CD pipelines.

這是一個展示全端 DevOps 能力的現代化履歷網站專案。不同於傳統的靜態網頁，本專案將「履歷資料」視為程式碼管理，採用 **Single Source of Truth (單一真理來源)** 架構，確保網頁瀏覽與下載版本的內容絕對一致。

基礎設施使用 **Terraform** 於 **Hetzner Cloud** 上從零建置，並透過 **K3s (Kubernetes)** 進行容器編排，最終由 **GitHub Actions** 實現全自動化部署。這是一個關於 IaC、容器化與 CI/CD 流程的實戰展示。

## ✨ Features

* **📄 Data-Driven Rendering**: All content (experience, skills, projects) is fetched from a single `data.json` file. No hard-coded HTML text.
* **⬇️ Dynamic Resume Generation**: Features a JavaScript-powered engine that instantly generates and downloads a formatted **HTML/PDF resume** based on the current `data.json`, ensuring the downloaded file always matches the website.
* **🌍 Bilingual Support**: Seamlessly toggles between **English** and **Traditional Chinese** without page reloads, managed dynamically via DOM manipulation.
* **🏗️ Infrastructure as Code**: Server provisioning, firewall rules, and DNS records are fully managed by **Terraform**.
* **☸️ Kubernetes Orchestration**: Hosted on a lightweight **K3s** cluster with **Traefik Ingress** for production-grade routing and load balancing.
* **🔄 Zero-Touch Deployment**: A complete CI/CD pipeline where a `git push` triggers Docker builds and automatic rolling updates on the live server.

## 🚀 Architecture

1. **Frontend**: A lightweight, vanilla JS application that fetches `data.json` to render the UI and handle resume generation.
2. **Containerization**: The app is packaged into a minimal Nginx-based Docker image.
3. **Infrastructure**:
* **Hetzner Cloud**: Hosting the VM (Ubuntu 24.04).
* **Cloudflare**: Managed DNS records via Terraform.


4. **Orchestration**:
* **K3s**: Lightweight Kubernetes distribution.
* **Traefik**: Ingress controller handling HTTP traffic.


5. **Automation**: GitHub Actions connects to Docker Hub and performs remote SSH commands to trigger K8s rollouts.

## 🛠️ Tech Stack

| Category | Technology |
| --- | --- |
| **Frontend** | HTML5, CSS3, JavaScript (ES6+), JSON |
| **Container** | Docker, Nginx (Alpine) |
| **Orchestration** | Kubernetes (K3s), Traefik Ingress |
| **IaC** | Terraform, HCL |
| **Cloud Provider** | Hetzner Cloud, Cloudflare |
| **CI/CD** | GitHub Actions, Linux Shell Scripting |

## ⚙️ Quick Start (Local Development)

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo

```

### 2. Run with Docker

You can simulate the production environment locally:

```bash
# Build the image
docker build -t my-resume-local .

# Run container on port 8080
docker run --rm -p 8080:80 my-resume-local

```

Visit `http://localhost:8080` to see the site.

### 3. Run with Python (Lightweight)

For quick frontend adjustments without rebuilding images:

```bash
python3 -m http.server 8080

```

## ☁️ Deployment & Infrastructure

This project uses **Terraform** to provision the cloud environment.

### 1. Prerequisites

Create a `terraform.tfvars` file inside the `infrastructure` folder (do not commit this file):

```hcl
hcloud_token         = "your_hetzner_api_token"
cloudflare_api_token = "your_cloudflare_api_token"
cloudflare_zone_id   = "your_zone_id"
ssh_public_key_path  = "~/.ssh/id_rsa.pub"

```

### 2. Provisioning

```bash
cd infrastructure
terraform init
terraform apply

```

This will:

1. Create a VM on Hetzner.
2. Set up Firewall rules (SSH, HTTP, HTTPS).
3. Install K3s via `user_data` script.
4. Deploy the initial Kubernetes Manifests (Deployment, Service, Ingress).
5. Update Cloudflare DNS to point to the new server IP.

### 3. CI/CD Setup

Configure the following **GitHub Secrets** for the Action workflow:

* `DOCKERHUB_USERNAME` / `DOCKERHUB_TOKEN`
* `SERVER_IP` (Output from Terraform)
* `SERVER_SSH_KEY` (Private key corresponding to the public key used in Terraform)