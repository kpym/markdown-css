#!/bin/sh

for css in *.css; do
  if [[ $css != *"min"* ]]; then
    ./min.sh $css
  fi
done
