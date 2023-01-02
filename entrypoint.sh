#!/bin/sh
set -e
while getopts ":c:l:f:i:k:f:e:" o; do
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
       i)
         export DOCKLE_IGNORES=${OPTARG}
         ;;
       k)
         export DOCKLE_ACCEPT_KEYS=${OPTARG}
         ;;
       f)
         export DOCKLE_ACCEPT_FILES=${OPTARG}
         ;;
       e)
         export DOCKLE_ACCEPT_FILE_EXTENSIONS=${OPTARG}
         ;;
       \?)
         echo "unknown flag"
         ;;
  esac
done

shift  $(($OPTIND - 1))

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