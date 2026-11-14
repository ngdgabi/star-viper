#!/bin/zsh
set -euo pipefail

# ==============================================================================
# One-Step GitHub Pages Publisher for Star Viper: Overdrive (NGD)
# Publishes ONLY the public marketing, Support URL & Privacy Policy URL site
# (protects your commercial $6.99 source code & DMG from public exposure!)
#
# Usage:
#   zsh ./publish_github_pages.sh <YOUR_GITHUB_USERNAME> [REPO_NAME]
# Example:
#   zsh ./publish_github_pages.sh gabordanielnagy star-viper
# ==============================================================================

GH_USER="${1:-}"
REPO_NAME="${2:-star-viper}"

if [[ -z "$GH_USER" ]]; then
    echo "Használat / Usage: zsh ./publish_github_pages.sh <GITHUB_FELHASZNALONEV> [star-viper]"
    exit 1
fi

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SITE_DIR"

REMOTE_URL="https://github.com/${GH_USER}/${REPO_NAME}.git"

if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$REMOTE_URL"
else
    git remote add origin "$REMOTE_URL"
fi

echo "==> Pushing public website to $REMOTE_URL (branch: main)..."
git branch -M main
git push -u origin main

BASE_URL="https://${GH_USER}.github.io/${REPO_NAME}"
echo ""
echo "======================================================================"
echo "SIKER! Kapcsold be a GitHub Pages-t itt:"
echo "  https://github.com/${GH_USER}/${REPO_NAME}/settings/pages"
echo "  (Source: 'Deploy from a branch' -> Branch: 'main' / '/ (root)' -> Save)"
echo ""
echo "App Store Connect URL-ek (másold be egyenesen a beküldésnél):"
echo "  Marketing URL      : ${BASE_URL}/"
echo "  Support URL        : ${BASE_URL}/support.html"
echo "  Privacy Policy URL : ${BASE_URL}/privacy.html"
echo "======================================================================"
