#!/bin/bash

lang=${1}
seed=${2}
input_model=${3}
model_name=${4}
export AMERICAS_DIR=/projects/abpu9500/americasnli
python $AMERICAS_DIR/run_finetuning.py \
    --collator_config configs/collator/finetuning/collator_default.yaml \
    --dataset_config configs/dataset/finetuning/anli_default.yaml \
    --experiment_config configs/experiment/finetuning/nli_default.yaml \
    --model_config configs/model/finetuning/xlmr_pretrained_seq.yaml \
    --tokenizer_config configs/tokenizer/xlmr_tokenizer.yaml \
    --training_args configs/training_arguments/finetuning/zs_default.yaml \
    --trainer_config configs/trainer/default.yaml \
    experiment_name=${model_name}\
    seed=${seed} \
    use_wandb=True \
    model_settings.init.pretrained_model_name_or_path=${input_model} \
    log_directory=/rc_scratch/abpu9500/logs/americasnli/ft/ \
    output_directory=/projects/abpu9500/models/pair-nlp/americasnli/ft/