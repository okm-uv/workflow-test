# workflow-test

1. workflow_dispatch ができる workflow をつくる : [参照](./.github/workflows/main.yaml)
2. workflow を実行する : [参照](run-workflow.sh)
3. workflow の一覧から run-id を取得する : [参照](get-workflow.sh)
4. run-id を使って job の一覧を取得し、 job から job-id を取得する : [参照](get-job-list.sh)
5. job-id から job の状態を取得する : [参照](get-job.sh)

## アクセストークンをつくる

- <https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>
- selected repositories
- action: write の permission が必要

## workflow_dispatch ができる workflow をつくる

- [参照](./.github/workflows/main.yaml)
- main (default-branch) にコミットされていること

## workflow を実行する

- <https://docs.github.com/ja/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event>
- [参照](run-workflow.sh)
- `actions/workflows/${FILE_NAME}/dispatches`
- data に、ビルド対象の ref と workflow の input に渡す変数を定義する

## workflow の一覧から run-id を取得する

- <https://docs.github.com/ja/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository>
- [参照](get-workflow.sh)
- `actions/runs`
- ひとつひとつが大きいので、クエリパラメータを使って取得する期間をしぼる

## run-id を使って job の一覧を取得し、 job から job-id を取得する

- <https://docs.github.com/ja/rest/actions/workflow-jobs?apiVersion=2022-11-28#list-jobs-for-a-workflow-run>
- [参照](get-job-list.sh)
- `actions/runs/${RUN_ID}/jobs`
- workflow 実行時に `step > name` を指定し、job 一覧からその名前を検索して job を特定する

## job-id から job の状態を取得する

- <https://docs.github.com/ja/rest/actions/workflow-jobs?apiVersion=2022-11-28#get-a-job-for-a-workflow-run>
- [参照](get-job.sh)
- `actions/jobs/${JOB_ID}`
- `status` と `conclusion` をみて判定する

CI test
