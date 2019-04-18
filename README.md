# Merge approved pull request action

A GitHub action to automatically merge pull requests (with a particular label)
that have been approved.

## Usage

```workflow
workflow "merge approved pull request on review" {
  resolves = ["merge"]
  on = "pull_request_review"
}

workflow "merge approved pull requst on push" {
  resolves = ["Automerge approved PRs"]
  on = "push"
}

action "merge" {
  uses = "framer/merge-approved-pull-request-action@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    MERGE_LABEL = "dependencies"
  }
}
```
