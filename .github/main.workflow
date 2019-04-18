workflow "Build things" {
  resolves = ["Automerge approved PRs"]
  on = "pull_request_review"
}

action "Automerge approved PRs" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    MERGE_LABEL = "dependencies"
  }
}
