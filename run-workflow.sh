#!/bin/sh -eu

run_worklow() {
  # https://docs.github.com/ja/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event
  result=$(curl --silent -X POST \
    -H 'Accept: application/vnd.github.v3+json' \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/workflows/main.yaml/dispatches" \
    -d '{"ref":"main", "inputs": {"logLevel":"info","message":"test running workflow"}}')

  echo "$result"
}

run_worklow "$@"
