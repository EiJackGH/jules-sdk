# 📦 Jules SDK
> A lightweight, cross-platform SDK designed for retro-style systems and custom emulators.

## 💻 Software and Tools
### 🚀 Built & Tested With
[![GNU Make](https://img.shields.io/badge/GNU%20Make-000000?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/software/make/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/)
[![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)](https://docs.python.org/3/)

### 🔌 Connectivity & Data
[![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)](https://dev.mysql.com/doc/)
[![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)](https://www.mongodb.com/docs/)

---

## 🛠️ Installation
```bash
git clone https://github.com/EiJackGH/Jules-SDK.git
cd Jules-SDK
make install

---

### 3. Automating with GitHub Actions
Since you use **GitLab** for CI/CD, you can mirror that workflow in GitHub to ensure the SDK compiles correctly on every push.

Create `.github/workflows/build.yml`:
```yaml
name: Build Jules SDK
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Compile
        run: make
