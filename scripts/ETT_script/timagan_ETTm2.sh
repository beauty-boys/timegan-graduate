#!/bin/bash

set -e

RUN_ID=$(date '+%Y%m%d_%H%M%S')_ETTm2
RUN_DIR=./runs/${RUN_ID}

mkdir -p "${RUN_DIR}"
mkdir -p "${RUN_DIR}/gru"
mkdir -p "${RUN_DIR}/lstm"

echo "RUN_ID=${RUN_ID}" > "${RUN_DIR}/config.txt"
echo "START_TIME=$(date '+%F %T')" >> "${RUN_DIR}/config.txt"
echo "data_name=ETTm2" >> "${RUN_DIR}/config.txt"
echo "seq_len=96" >> "${RUN_DIR}/config.txt"
echo "hidden_dim=24" >> "${RUN_DIR}/config.txt"
echo "num_layer=3" >> "${RUN_DIR}/config.txt"
echo "iteration=50000" >> "${RUN_DIR}/config.txt"
echo "batch_size=128" >> "${RUN_DIR}/config.txt"
echo "metric_iteration=10" >> "${RUN_DIR}/config.txt"

echo "$(date '+%F %T') [SCRIPT START]" >> "${RUN_DIR}/master.log"

echo "$(date '+%F %T') [START] GRU" >> "${RUN_DIR}/master.log"
python3 -u main_timegan.py \
  --data_name ETTm2 \
  --seq_len 96 \
  --module gru \
  --hidden_dim 24 \
  --num_layer 3 \
  --iteration 50000 \
  --batch_size 128 \
  --metric_iteration 10 \
  --run_dir "${RUN_DIR}/gru" \
  >> "${RUN_DIR}/gru/train.log" 2>> "${RUN_DIR}/gru/error.log"
echo "$(date '+%F %T') [END] GRU" >> "${RUN_DIR}/master.log"

echo "$(date '+%F %T') [START] LSTM" >> "${RUN_DIR}/master.log"
python3 -u main_timegan.py \
  --data_name ETTm2 \
  --seq_len 96 \
  --module lstm \
  --hidden_dim 24 \
  --num_layer 3 \
  --iteration 50000 \
  --batch_size 128 \
  --metric_iteration 10 \
  --run_dir "${RUN_DIR}/lstm" \
  >> "${RUN_DIR}/lstm/train.log" 2>> "${RUN_DIR}/lstm/error.log"
echo "$(date '+%F %T') [END] LSTM" >> "${RUN_DIR}/master.log"

echo "$(date '+%F %T') [SCRIPT END]" >> "${RUN_DIR}/master.log"