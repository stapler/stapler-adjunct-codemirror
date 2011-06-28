#!/bin/bash
#wget -O codemirror.zip http://codemirror.net/codemirror.zip
#unzip codemirror.zip
src=$(echo CodeMirror-*)

dst=src/main/resources/org/kohsuke/stapler/codemirror
rm -rf $dst || true
mkdir -p $dst || true
cp -R $src/lib $dst/lib
cp -R $src/mode $dst/mode
cp -R $src/theme $dst/theme
for modejs in $dst/mode/*/*.js
do
    (
      echo "// @include org.kohsuke.stapler.codemirror.lib.codemirror"
      cat $modejs
    ) > $modejs.bak
    mv $modejs.bak $modejs
done
rm $dst/mode/*/index.html
