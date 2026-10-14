#!/usr/bin/env bash
# Crawl Google Scholar from this machine and publish the results to the
# google-scholar-stats branch (read by the site for citation counts).
# Google Scholar blocks GitHub Actions runners, so run this locally:
#   bash google_scholar_crawler/update_stats.sh
set -euo pipefail
cd "$(dirname "$0")"

SCHOLAR_ID="${GOOGLE_SCHOLAR_ID:-LtnqkXYAAAAJ}"
REPO_SLUG="polieste/polieste.github.io"
REPO_URL="$(git remote get-url origin)"

[ -d .venv ] || python -m venv .venv
PY=.venv/bin/python; [ -x "$PY" ] || PY=.venv/Scripts/python
"$PY" -m pip install -q --disable-pip-version-check -r requirements.txt

rm -rf results
echo "Crawling Google Scholar profile $SCHOLAR_ID ..."
GOOGLE_SCHOLAR_ID="$SCHOLAR_ID" "$PY" main.py > /dev/null

cd results
git init -q
git add *.json
git -c user.name="$(git -C .. config user.name)" -c user.email="$(git -C .. config user.email)" \
    commit -qm "Updated Citation Data"
git push -q "$REPO_URL" HEAD:google-scholar-stats --force
echo "Pushed: $(cat gs_data_shieldsio.json)"
cd ..
rm -rf results

# Refresh the CDN copy the site reads from
for f in gs_data.json gs_data_shieldsio.json; do
    curl -s -o /dev/null "https://purge.jsdelivr.net/gh/$REPO_SLUG@google-scholar-stats/$f"
done
echo "Done."
