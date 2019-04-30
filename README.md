# Merge approved pull request action

A GitHub action to automatically merge pull requests that have been approved. It
will only work pull requests that have been labeled (configurable using the `$MERGE_LABEL`
environment variable.

## Usage

```workflow
workflow "merge approved pull request on schedule" {
  resolves = ["merge"]
  on = "schedule(*/15 * * * *)"
}

action "merge" {
  uses = "framer/merge-approved-pull-request-action@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    MERGE_LABEL = "dependencies"
  }
}
```
