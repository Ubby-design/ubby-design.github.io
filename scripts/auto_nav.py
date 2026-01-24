#!/usr/bin/env python3

import os
import yaml

DOCS_DIR = "docs"
MKDOCS_FILE = "mkdocs.yml"


def build_tree(path, base=""):
    items = []

    for entry in sorted(os.listdir(path)):
        full = os.path.join(path, entry)
        rel = f"{base}/{entry}" if base else entry

        if os.path.isdir(full):
            children = build_tree(full, rel)
            if children:
                items.append({entry.replace("-", " ").title(): children})

        elif entry.endswith(".md"):
            name = os.path.splitext(entry)[0]

            if name.lower() == "index":
                title = "Overview"
            else:
                title = name.replace("-", " ").title()

            items.append({title: rel})

    return items


with open(MKDOCS_FILE) as f:
    config = yaml.safe_load(f)

nav = [{"Home": "index.md"}]

for section in sorted(os.listdir(DOCS_DIR)):
    section_path = os.path.join(DOCS_DIR, section)

    if os.path.isdir(section_path):
        nav.append({section.replace("-", " ").title(): build_tree(section_path, section)})

config["nav"] = nav

with open(MKDOCS_FILE, "w") as f:
    yaml.dump(config, f, sort_keys=False)

print("Navigation generated successfully.")

