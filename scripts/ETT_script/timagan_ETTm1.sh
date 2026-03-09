#!/bin/bash

mkdir -p log

echo "$(date '+%F %T') [START] GRU" >> log/run_timegan_master.log
python3 main_timegan.py \
  --data_name ETTm1 \
  --seq_len 96 \
  --module gru \
  --hidden_dim 24 \
  --num_layer 3 \
  --iteration 50000 \
  --batch_size 128 \
  --metric_iteration 10 \
  > log/timegan_gru_ETTm1.log 2>&1

echo "$(date '+%F %T') GRU finished" >> log/run_timegan_master.log

echo "$(date '+%F %T') [START] LSTM" >> log/run_timegan_master.log
python3 main_timegan.py \
  --data_name ETTm1 \
  --seq_len 96 \
  --module lstm \
  --hidden_dim 24 \
  --num_layer 3 \
  --iteration 50000 \
  --batch_size 128 \
  --metric_iteration 10 \
  > log/timegan_lstm_ETTm1.log 2>&1

echo "$(date '+%F %T') LSTM finished" >> log/run_timegan_master.log