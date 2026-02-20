### Automating with GitHub Actions
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
