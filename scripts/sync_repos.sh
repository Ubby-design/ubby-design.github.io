#!/bin/bash
# ======================================================
# FSIE Labs Multi-Repo Full Sync + Auto-Nav Script
# ======================================================

set -e

WORKDIR=$(pwd)
TMP_DIR="$WORKDIR/tmp"
DOCS_DIR="$WORKDIR/docs"

# List of content repos
CONTENT_REPOS=(
    "git@github.com:Ubby-design/fsie_projects.git"
    # Add more repos here if needed
)

# -------------------------------
# Function: clone or update repo
# -------------------------------
update_repo() {
    REPO_URL=$1
    REPO_NAME=$(basename $REPO_URL .git)
    REPO_TMP="$TMP_DIR/$REPO_NAME"

    if [ -d "$REPO_TMP" ]; then
        echo "Updating repo $REPO_NAME..."
        git -C "$REPO_TMP" pull
    else
        echo "Cloning repo $REPO_NAME..."
        git clone "$REPO_URL" "$REPO_TMP"
    fi
}

# -------------------------------
# Prepare tmp and docs directories
# -------------------------------
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"
mkdir -p "$DOCS_DIR"

# -------------------------------
# Loop through all repos
# -------------------------------
for REPO in "${CONTENT_REPOS[@]}"; do
    update_repo $REPO
    REPO_NAME=$(basename $REPO .git)
    REPO_TMP="$TMP_DIR/$REPO_NAME"

    echo "Copying README.md and index.md recursively from $REPO_NAME..."
    find "$REPO_TMP" -type f \( -iname "README.md" -o -iname "index.md" \) | while read file; do
        # Destination path: preserve relative path, replace README.md or index.md with .md
        dest="$DOCS_DIR/$(echo $file | sed "s|$TMP_DIR/||" | sed 's|/README.md|.md|; s|/index.md|.md|')"
        mkdir -p "$(dirname "$dest")"
        cp "$file" "$dest"
        echo "Copied $file → $dest"
    done
done

# -------------------------------
# Generate MkDocs nav automatically
# -------------------------------
echo "Generating mkdocs nav automatically..."
python3 scripts/auto_nav.py

echo "All done!"


