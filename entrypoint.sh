#!/bin/bash
set -e
while getopts "c:l:f:i:k:f:e:" o; do
   case "${o}" in
       c)
         export exitCode=${OPTARG}
         ;;
       l)
         export exitLevel=${OPTARG}
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
  esac
done

/usr/bin/dockle --exit-code ${exitCode} --exit-level ${exitLevel} --format ${format} $1