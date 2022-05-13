#!/bin/bash

lang=${1}
seed=${2}
model=/rc_scratch/abpu9500/americasnli/mlm/${lang}/final_model/

python run_finetuning.py \
    --collator_config configs/collator/finetuning/collator_default.yaml \
    --dataset_config configs/dataset/finetuning/anli_default.yaml \
    --experiment_config configs/experiment/finetuning/nli_default.yaml \
    --model_config configs/model/finetuning/xlmr_pretrained_seq.yaml \
    --tokenizer_config configs/tokenizer/xlmr_tokenizer.yaml \
    --training_args configs/training_arguments/finetuning/zs_default.yaml \
    --trainer_config configs/trainer/default.yaml \
    experiment_name=zero_shot_mlm_en_${lang}_${seed} \
    seed=${seed} \
    use_wandb=True \
    model_settings.init.pretrained_model_name_or_path=${model} \
    log_directory=/rc_scratch/abpu9500/logs/americasnli/ft/ \
    output_directory=/rc_scratch/abpu9500/model/americasnli/ft/
