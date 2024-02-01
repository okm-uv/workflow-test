#!/usr/bin/sh

get_token() {
  jwt=$(python create_jwt.py)

  installations_result=$(
    curl --silent \
      "https://api.github.com/app/installations" \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer ${jwt}" \
      -H "X-GitHub-Api-Version: 2022-11-28"
  )

  id=$(echo "${installations_result}" | jq -r ".[].id")
  access_tokens_result=$(
    curl --silent -X POST \
      "https://api.github.com/app/installations/${id}/access_tokens" \
      -H 'Accept: application/vnd.github.v3+json' \
      -H "Authorization: Bearer ${jwt}"
  )

  token=$(echo "${access_tokens_result}" | jq -r ".token")
  echo "${token}"
}

get_token "$@"
