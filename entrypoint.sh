#!/bin/sh
set -ex

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

function run_dockle() {
  /usr/bin/dockle $@ $imageName
}

FIRST_ARGS=""
SECOND_ARGS=""

if [ $exitLevel ]; then
  FIRST_ARGS="$FIRST_ARGS --exit-level $exitLevel"
  SECOND_ARGS="$SECOND_ARGS --exit-level $exitLevel"
fi

# 1st time: run dockle with exit 0 for left a report file
if [ $format ]; then
  FIRST_ARGS="$FIRST_ARGS --format $format"
fi
if [ $output ]; then
  FIRST_ARGS="$FIRST_ARGS --output $output"
fi

# 2nd time: run dockle with exit code without report file
if [ $exitCode ]; then
  SECOND_ARGS="$SECOND_ARGS --exit-code $exitCode"
fi

RUN_TWICE=""
if [ "$output" != "" ] && [ "$exitCode" != '0' ]; then
  RUN_TWICE="TRUE"
fi

if [ $RUN_TWICE ]; then
  run_dockle $FIRST_ARGS
  run_dockle $SECOND_ARGS
else
  run_dockle $FIRST_ARGS $SECOND_ARGS
fi
