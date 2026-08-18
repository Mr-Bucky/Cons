#!/bin/bash

cd /tmp

curl -s https://bsideslv.org/talks -o bsideslv.talks
grep -A 3 h4 bsideslv.talks | sed -e 's/    <h4.*\">/"/g' -e 's/<\/h4>/",/g' -e 's/&amp;/\&/g' -e 's/    <p>//g' -e 's/<\/p>//g' -e 's/\-\-//g' -e 's/, Monday/,Monday,/g' -e 's/, Tuesday/,Tuesday,/g' -e 's/, Wednesday/,Wednesday,/g' | grep . | paste -d' ' - - | sort > BSidesLV_2026_Sort.csv

exit
