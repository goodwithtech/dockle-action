# dockle-action

GitHub Actions for [goodwithtech/dockle](https://github.com/goodwithtech/dockle)

> Dockle - Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start

Dockle helps you:

1. Build Best Practice Docker images
2. Build secure Docker images
  - Checkpoints include CIS Benchmarks

# Examples

- https://github.com/goodwithtech/dockle-action-test/blob/main/.github/workflows/simple-stdout.yml
- https://github.com/goodwithtech/dockle-action-test/blob/main/.github/workflows/output-json-file.yml

# Usage

```yaml
name: check
on:
  push:
jobs:
  build:
    name: Build
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Build an image from Dockerfile
        run: |
          docker build -t built-image:scan .
      - name: Run dockle
        uses: goodwithtech/dockle-action@main
        with:
          image: 'built-image:scan'
          format: 'list'
          exit-code: '1'
          exit-level: 'warn'
          ignore: 'CIS-DI-0001,DKL-DI-0006'
```