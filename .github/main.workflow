workflow "Run tests" {
  on = "push"
  resolves = ["ShellCheck", "Bats", "Dockerfilelint"]
}

action "ShellCheck" {
  uses = "actions/bin/shellcheck@master"
  args = "./merge-pull-request"
}

action "Bats" {
  uses = "actions/bin/bats@master"
  args = "./test/*.bats"
}

action "Dockerfilelint" {
  uses = "docker://replicated/dockerfilelint"
  args = ["./Dockerfile"]
}
