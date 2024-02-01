#!/bin/sh -eu

run_workflow() {
  token=$(sh get-token.sh)

  # https://docs.github.com/ja/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event
  result=$(curl --silent -X POST \
    -H 'Accept: application/vnd.github.v3+json' \
    -H "Authorization: Bearer ${token}" \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/workflows/main.yaml/dispatches" \
    -d '{"ref":"main", "inputs": {"logLevel":"info","message":"test running workflow"}}')

  echo "$result"
}

run_workflow "$@"
