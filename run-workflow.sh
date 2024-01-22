#! /usr/bin/sh -eu

run_worklow() {
  workflow_list=$(curl --silent \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    https://api.github.com/repos/okm-uv/workflow-test/actions/workflows)

  echo "${workflow_list}"
  id=$(echo "${workflow_list}" | jq -r ".workflows[0].id")
  echo "$id"

  result=$(curl --silent -X POST \
    -H 'Accept: application/vnd.github.v3+json' \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/workflows/${id}/dispatches" \
    -d '{"ref":"main", "inputs": {"logLevel":"info","message":"test running workflow"}}')

  echo "$result"
}

run_worklow "$@"
