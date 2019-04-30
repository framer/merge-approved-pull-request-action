workflow "Check things" {
  resolves = ["Shellcheck"]
  on = "push"
}

action "Shellcheck" {
  uses = "actions/bin/shellcheck@master"
  args = "merge-pull-request"
}

workflow "Merge things" {
  resolves = ["Automerge approved PRs"]
  on = "schedule(*/15 * * * *)"
}

action "Automerge approved PRs" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    MERGE_LABEL = "dependencies"
  }
}
