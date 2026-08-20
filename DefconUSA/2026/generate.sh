#!/bin/bash

curl -s https://defcon.org/html/defcon-34/dc-34-workshops.html -o DCWorkshops

egrep 'talk-title|time-room' DCWorkshops | sed -e 's/<h.*talk-title">/\"/g' -e 's/<\/h3>/\",/g' -e 's/^.*time-room">//g' -e 's/^Friday /Fri,/g' -e 's/^Saturday /Sat,/g' -e 's/^Sunday /Sun,/g' -e 's/<br \/>  /,/g' -e 's/ <\/p>//g' -e 's/, at LVCC /,LVCC /g'  | paste -d' ' - - > dcw.csv

# This worked for the original dev webpage.  Formatting changed in production. The workshops originally were sorted by title
# and not date/time, so having the list in CSV format would make sorting easy.  I still like to see all options for a specific
# time.

#egrep 'talk-title|time-room' DCWorkshops | sed -e 's/<h.*talk-title">/\"/g' -e 's/<\/h3>/\",/g' -e 's/^.*time-room">//g' -e 's/Friday at /Fri,/g' -e 's/Saturday at /Sat,/g' -e 's/Sunday at /Sun,/g' -e 's/:00 in /:00,/g' -e 's/<br \/>  /,/g' -e 's/ <\/p>//g' | paste -d' ' - - > dcw.csv

exit
