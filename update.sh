#!/bin/bash

function print_usage {
  echo "$0 [patch] [minor] [major]"
}

function main {
  if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
    print_usage;
    exit 1
  fi

  readonly VERSION_PATCH=$1
  readonly VERSION_MINOR=$2
  readonly VERSION_MAJOR=$3

  for file in README.md Dockerfile; do
    cat "${file}.template" \
      | sed -e "s/{{MAJOR}}/${VERSION_MAJOR}/g" \
      | sed -e "s/{{MINOR}}/${VERSION_MINOR}/g" \
      | sed -e "s/{{PATCH}}/${VERSION_PATCH}/g" \
      > "${file}"
  done

  if [[ -z "$(git status -s Dockerfile)" ]]; then
    echo "No changes. Aborting update."
    exit 1
  fi

  git tag -d "${VERSION_MINOR}" "${VERSION_MAJOR}"

  git commit -m "Tag release v${VERSION_PATCH}" README.md Dockerfile
  git tag -a "${VERSION_PATCH}" -m "v${VERSION_PATCH}"
  git tag -a "${VERSION_MINOR}" -m "v${VERSION_PATCH}"
  git tag -a "${VERSION_MAJOR}" -m "v${VERSION_PATCH}"

  # Show changes
  git show HEAD
  git lg | head -n 1

  # Confirm changes
  read -p "Does this look Ok? [Y/n] " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    git reset --soft HEAD~
    git tag -d "${VERSION_MINOR}" "${VERSION_MAJOR}" "${VERSION_PATCH}"

    exit 1
  fi

  git push --delete origin "${VERSION_MAJOR}"
  git push --delete origin "${VERSION_MINOR}"
  git push --tags origin master
}

main $1 $2 $3;
