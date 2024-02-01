#!/bin/sh -eu

get_job_list() {
  # https://docs.github.com/ja/rest/actions/workflow-jobs?apiVersion=2022-11-28#list-jobs-for-a-workflow-run
  command=$(echo curl --silent \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    "https://api.github.com/repos/okm-uv/workflow-test/actions/runs/${RUN_ID}/jobs")

  echo "$command"
  job_list=$($command)

  echo "${job_list}"
}

get_job_list "$@"
