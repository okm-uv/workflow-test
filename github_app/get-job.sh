#!/bin/sh -eu

get_job() {
  token=$(sh get-token.sh)

  # https://docs.github.com/ja/rest/actions/workflow-jobs?apiVersion=2022-11-28#get-a-job-for-a-workflow-run
  job_info=$(curl --silent \
    -H "Authorization: Bearer  ${token}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/jobs/${JOB_ID}")

  echo "${job_info}"
}

get_job "$@"
