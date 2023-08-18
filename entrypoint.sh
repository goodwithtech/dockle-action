#!/bin/sh
set -e

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

env
echo $ARGS

/usr/bin/dockle $ARGS $imageName