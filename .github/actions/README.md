# Sandbox Action

The IOTA Sandbox provides two actions to use the sandbox in CI/CD for testing. `setup` and `teardown`.

# Usage

You can add those actions to your workflow by simply using it in a step. You can specify a version of the sandbox to use, or a commit-ish ref, to use any commit, branch or tag.

```yml
name: Sandbox

on:
  workflow-dispatch

env:
  # Specify which profiles you want to enable.
  COMPOSE_PROFILES: 'inx-indexer, chronicle'

jobs:
  sandbox:
    runs-on: ubuntu-latest
    steps:
      - name: Start iota sandbox
        uses: 'iotaledger/iota-sandbox/.github/actions/setup'
        with:
          # Specify a iota-sandbox version.
          version: 'v1.1.0'
          # In case you want to use a commit-ish ref, set version to '' and specify a commit-ish ref
          branch: branch-xy

      - name: Tear down iota sandbox
        uses: 'iotaledger/iota-sandbox/.github/actions/setup'
```