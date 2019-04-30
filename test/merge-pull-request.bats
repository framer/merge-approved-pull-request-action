#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/bin"

function setup() {
  export WORKSPACE="${WORKSPACE-"${BATS_TEST_DIRNAME}/.."}"

  export TOKEN="foo"
  export MERGE_LABEL="baz"
}

function teardown() {
  unset "${!MERGE_LABEL@}"
  unset "${!TOKEN@}"
  unset "${!GITHUB_TOKEN@}"
}

@test "open pull requests with merge label get merged" {
  local stdoutPath="${BATS_TMPDIR}/${BATS_TEST_NAME}.stdout"
  "$WORKSPACE/merge-pull-request" 1>${stdoutPath}

  # NOTE: check that the PR is going to be merged
  grep "Merging pull request #1" "$stdoutPath"

  grep "Foo merged" "$stdoutPath"
}
