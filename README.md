# Merge approved pull request action

A GitHub action to automatically merge pull requests that have been approved. It
will only work pull requests that have been labeled (configurable using the `$MERGE_LABEL`
environment variable.

## Usage

Create a new GitHub Actions workflow file (e.g. `.github/workflows/merge.yml`)
with the following definition.

```yaml
---
on:
  schedule:
    - cron: "*/15 * * * *"

name: Merge approved pull request
jobs:
  merge:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: merge
        uses: framer/merge-approved-pull-request-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          MERGE_LABEL: dependencies

```
