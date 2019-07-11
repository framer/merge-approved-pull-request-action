#!/usr/bin/env bats

load bootstrap

PATH="$BATS_TEST_DIRNAME/bin:$PATH"

function setup() {
  export WORKSPACE="${WORKSPACE-"${BATS_TEST_DIRNAME}/.."}"

  export TOKEN="foo"
  export MERGE_LABEL="baz"
}

function teardown() {
  unset "${!MERGE_LABEL@}"
  unset "${!TOKEN@}"
  unset "${!GITHUB_TOKEN@}"

  unset "${!NO_REVIEWS@}"
}

@test "open pull requests with merge label get merged" {
  local stdoutPath="${BATS_TMPDIR}/${BATS_TEST_NAME}.stdout"
  "$WORKSPACE/merge-pull-request" 1>${stdoutPath}

  grep "Merging pull request #2" "$stdoutPath"
  grep "Merging pull request #1" "$stdoutPath"

  grep "Foo merged" "$stdoutPath"
}

@test "open pull request with no reviews does not get merged" {
  local stdoutPath="${BATS_TMPDIR}/${BATS_TEST_NAME}_1.stdout"

  export NO_REVIEWS=1

  "$WORKSPACE/merge-pull-request" 1>${stdoutPath}

  grep "Could not find any reviews approving pull request #2." "$stdoutPath"
  grep "Could not find any reviews approving pull request #1." "$stdoutPath"
}
