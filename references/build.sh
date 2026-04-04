#!/bin/bash
# 从部分组装课程。
# 从课程目录运行：bash build.sh
set -e
cat _base.html modules/*.html _footer.html > index.html
echo "已构建 index.html — 在浏览器中打开它。"
