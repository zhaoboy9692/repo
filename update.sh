#!/bin/bash
dpkg-scanpackages -m ./debs > ./Packages && bzip2 -c9 Packages > Packages.bz2
xz -c9 Packages > Packages.xz
xz -5fkev --format=lzma Packages > Packages.lzma
lz4 -c9 Packages > Packages.lz4
gzip -c9 Packages > Packages.gz
zstd -c19 Packages > Packages.zst && git add . && git commit -m "提交更新" && git push
echo "生成成功！"
