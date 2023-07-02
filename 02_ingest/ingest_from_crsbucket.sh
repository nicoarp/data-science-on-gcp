#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./ingest_from_crsbucket.sh  destination-bucket-name"
    exit
fi

BUCKET=$1
FROM=gs://data-science-on-gcp/edition2/flights/raw
TO=gs://$BUCKET/flights/raw

CMD="gsutil -m cp "
for MONTH in `seq -w 1 12`; do
  CMD="$CMD ${FROM}/2016${MONTH}.csv"
done
CMD="$CMD ${FROM}/201702.csv $TO"

echo $CMD
$CMD
