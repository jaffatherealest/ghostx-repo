#!/bin/sh
set -eu
REPO=${1:-jaffatherealest/ghostx-repo}
cd "$(dirname "$0")"
if [ ! -d .git ]; then
    git init -b main
fi
git add .
git commit -m "GhostX Sileo repo $(date +%Y-%m-%d)" || true
if ! git remote get-url origin >/dev/null 2>&1; then
    gh repo create "$REPO" --public --source=. --remote=origin
fi
git push -u origin main
# Enable GitHub Pages from the repository root.
printf '{"source":{"branch":"main","path":"/"}}' | \
    gh api -X POST "repos/$REPO/pages" --input - >/dev/null 2>&1 || \
    printf '{"source":{"branch":"main","path":"/"}}' | \
    gh api -X PUT "repos/$REPO/pages" --input - >/dev/null 2>&1 || true
echo "Repo: https://github.com/$REPO"
echo "Sileo: https://${REPO%%/*}.github.io/${REPO##*/}/"
