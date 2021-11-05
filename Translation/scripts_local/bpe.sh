#!/bin/bash

DATADIR= "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local"

# applicable only when BPE="src" or "src+tgt"
#BPE_SRC_OPS=50000

# applicable only when BPE="tgt" or "src+tgt"
#BPE_TRG_OPS=50000

#echo "Preprocessing inputs"

#echo "BPE on $EXTENSION"
learn_bpe.py -s 50000 < "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/train.tok.clean.src" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.src"

apply_bpe.py -c "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.src" <  "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/train.tok.clean.src" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/train.tok.clean.sw.src"
apply_bpe.py -c "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.src" <  "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/dev.tok.clean.src" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/dev.tok.clean.sw.src"
apply_bpe.py -c "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.src" < "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/test.tok.clean.src" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/test.tok.clean.sw.src"


learn_bpe.py -s 50000 < "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/train.tok.clean.trg" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.trg"
apply_bpe.py -c "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.trg" <  "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/train.tok.clean.trg" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/train.tok.clean.sw.trg"
apply_bpe.py -c "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.trg" < "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/dev.tok.clean.trg" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/dev.tok.clean.sw.trg"
apply_bpe.py -c "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/bpe-codes.trg" <  "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/test.tok.clean.trg" > "/content/drive/MyDrive/Software_Engineering/CodeRelated/Translation/scripts_local/test.tok.clean.sw.trg"
#echo "Done"
