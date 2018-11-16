#!/usr/bin/env bash

set -e

LOADER_MODULE=./output/HelloLoader/index.js
LOADER_BINDING=loader
OUTPUT=./src/loaders/hello-loader.js

WEBPACK_ENTRY=$(mktemp -p .)
mv webpack.config.js _webpack.bak
clean_up() {
    ARG=$?
    mv _webpack.bak webpack.config.js
    rm "$WEBPACK_ENTRY"
    exit $ARG
}
trap clean_up EXIT

cat <<EOF >"$WEBPACK_ENTRY"
module.exports=require('${LOADER_MODULE}').${LOADER_BINDING};
EOF

./node_modules/.bin/webpack \
    --mode production \
    --target node \
    --entry "$WEBPACK_ENTRY" \
    -o "$OUTPUT" \
    --output-library-target commonjs-module
