#!/bin/sh
set -e


export DOCKLE_IGNORES=${INPUT_IGNORE}
export DOCKLE_ACCEPT_KEYS=${INPUT_ACCEPT-KEY}
export DOCKLE_ACCEPT_FILES=${INPUT_ACCEPT-FILE}
export DOCKLE_ACCEPT_FILE_EXTENSIONS=${INPUT_ACCEPT-FILE-EXTENSION}

while getopts ":t:c:l:o:f:" o; do
   case "${o}" in
       t)
         export imageName=${OPTARG}
         ;;
       c)
         export exitCode=${OPTARG}
         ;;
       l)
         export exitLevel=${OPTARG}
         ;;
       o)
         export output=${OPTARG}
         ;;
       f)
         export format=${OPTARG}
         ;;
       \?)
         echo "unknown flag"
         ;;
  esac
done

#shift  $(($OPTIND - 1))

ARGS=""
if [ $format ];then
 ARGS="$ARGS --format $format"
fi
if [ $exitCode ];then
 ARGS="$ARGS --exit-code $exitCode"
fi
if [ $exitLevel ];then
 ARGS="$ARGS --exit-level $exitLevel"
fi
if [ $output ];then
 ARGS="$ARGS --output $output"
fi

/usr/bin/dockle $ARGS $imageName