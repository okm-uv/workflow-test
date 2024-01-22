#!/bin/sh -eu

show_workflows() {
  workflow_list=$(curl --silent \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    https://api.github.com/repos/okm-uv/workflow-test/actions/workflows)

  echo "${workflow_list}"
}

show_workflows "$@"
