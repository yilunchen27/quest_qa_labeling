#!/bin/bash

toy=${1:-False}

if [ $toy = 'toy' ]; then
    epochs=1
else
    epochs=4
fi

python step6_model4_bart_code/run.py \
    --data_path=input/google-quest-challenge \
    --epochs=$epochs \
    --max_sequence_length=500 \
    --max_title_length=26 \
    --max_question_length=260 \
    --max_answer_length=210 \
    --batch_accumulation=4 \
    --batch_size=2 \
    --warmup=250 \
    --lr=2e-5 \
    --bert_model=input/model4_ckpt/bart.large/ \
    --pseudo_file=pseudo-predictions/pseudo-100k-3x-blend-no-leak/fold-{}.csv.gz \
    --split_pseudo \
    --leak_free_pseudo \
    --label=bart \
    --toy=$toy
