#!/bin/sh -eu

show_workflows() {
  token=$(sh get-token.sh)

  workflow_list=$(curl --silent \
    -H "Authorization: Bearer  ${token}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    https://api.github.com/repos/okm-uv/workflow-test/actions/workflows)

  echo "${workflow_list}"
}

show_workflows "$@"
