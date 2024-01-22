#!/bin/sh -eu

get_job() {
  job_info=$(curl --silent \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/jobs/${JOB_ID}")

  echo "${job_info}"
}

get_job "$@"
