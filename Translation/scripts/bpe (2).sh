#!/bin/bash

DATADIR=$1

# applicable only when BPE="src" or "src+tgt"
BPE_SRC_OPS=50000

# applicable only when BPE="tgt" or "src+tgt"
BPE_TRG_OPS=50000

echo "Preprocessing inputs"
for EXTENSION in src trg
do 
    echo "BPE on $EXTENSION"
    learn_bpe.py -s $BPE_SRC_OPS < $DATADIR/train.tok.clean.${EXTENSION} > $DATADIR/bpe-codes.${EXTENSION}

    apply_bpe.py -c $DATADIR/bpe-codes.${EXTENSION} <  $DATADIR/train.tok.clean.${EXTENSION} > $DATADIR/train.tok.clean.sw.${EXTENSION}
    apply_bpe.py -c $DATADIR/bpe-codes.${EXTENSION} <  $DATADIR/dev.tok.clean.${EXTENSION} > $DATADIR/dev.tok.clean.sw.${EXTENSION}
    apply_bpe.py -c $DATADIR/bpe-codes.${EXTENSION} <  $DATADIR/test.tok.clean.${EXTENSION} > $DATADIR/test.tok.clean.sw.${EXTENSION}
done
echo "Done"
