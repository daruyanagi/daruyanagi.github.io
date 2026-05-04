"""
XTimelineViewer の README を取得して content/apps/xtimelineviewer/index.md を生成する。
ローカルビルド前に手動で実行するか、CI が自動実行する。
"""

import os
import urllib.request

url = "https://raw.githubusercontent.com/daruyanagi/XTimelineViewer/main/README.md"
with urllib.request.urlopen(url) as f:
    content = f.read().decode("utf-8")

lines = content.split("\n")
title = "XTimelineViewer"
body_start = 0
for i, line in enumerate(lines):
    if line.startswith("# "):
        title = line[2:].strip()
        body_start = i + 1
        break

body = "\n".join(lines[body_start:]).lstrip("\n")

front_matter = f'---\ntitle: "{title}"\n---\n\n'

os.makedirs("content/apps/xtimelineviewer", exist_ok=True)
with open("content/apps/xtimelineviewer/index.md", "w", encoding="utf-8") as f:
    f.write(front_matter + body)

print(f"Generated: content/apps/xtimelineviewer/index.md")
print(f"Title: {title}")
