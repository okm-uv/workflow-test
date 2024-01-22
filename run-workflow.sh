#! /usr/bin/sh -eu

run_worklow() {
  result=$(curl -vv \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    https://api.github.com/repos/okm-uv/workflow-test/actions/workflows)

  echo "${result}"
  id=$(echo "${result}" | jq -r ".workflows[0].id")
  echo "$id"

  curl \
    -X POST \
    -H 'Accept: application/vnd.github.v3+json' \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/workflows/${id}/dispatches" \
    -d '{"ref":"main", "inputs": {"logLevel":"info","tags":false}}'
}

run_worklow "$@"
