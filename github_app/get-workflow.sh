#!/bin/sh -eu

get_workflow() {
  token=$(sh get-token.sh)

  # https://docs.github.com/ja/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository
  command=$(echo curl --silent \
    -H "Authorization: Bearer  ${token}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    https://api.github.com/repos/okm-uv/workflow-test/actions/runs?created=%3E2024-01-22T16%3A00%3A00%2B09%3A00)

  workflow_list=$($command)

  echo "${workflow_list}"
}

get_workflow "$@"
