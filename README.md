# Github Actions

> Medium: https://panachai-ny.medium.com/github-actions-auto-draft-release-with-github-actions-fae5a532029

## Auto draft release

Action command: `.github/workflows/auto-draft.yml`

Template: `.github/release-drafter.yml`

## Auto Labeler

Action command: `.github/workflows/pr-labeler.yml`

Template: `.github/pr-labeler.yml`

## TODO

- [ ] auto integrate with JIRA link when add card number on title of PR `[XX-1] <title message>`
- [ ] auto semantic versioning depend on branch
  > such as have `feature` running minor / not have just rinning patch
