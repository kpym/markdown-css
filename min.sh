#!/bin/sh

base="${1%.*}"
echo "$base.css » $base.min.css"
esbuild --bundle "$base.css" --minify --loader:.png=dataurl --loader:.woff=dataurl --outfile="$base.min.css"
