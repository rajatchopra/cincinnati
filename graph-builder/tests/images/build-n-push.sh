#!/usr/bin/env bash
set -xe

unused=${1:?"Please provide at least one target directory in the arguments"}

REPO_BASE=${REPO_BASE:-"quay.io/rajatchopra/egx-ota"}

for target in "${@}"; do
  full_tag="${REPO_BASE}"-"${target%-*}:${target##*-}" 
  docker build -t "${full_tag}" "${target}"
  docker push "${full_tag}"
done
