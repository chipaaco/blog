#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

export BUNDLE_PATH="${BUNDLE_PATH:-vendor/bundle}"
export BUNDLE_USER_HOME="${BUNDLE_USER_HOME:-$HOME/.bundle}"

bundle check >/dev/null 2>&1 || bundle install
bundle exec jekyll serve --livereload --force_polling --drafts --baseurl "" "$@"
