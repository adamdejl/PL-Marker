
GPU_ID=0

# For ALBERT-xxlarge, change learning_rate from 2e-5 to 1e-5

# ACE05
# SciERC
mkdir radgraph_models
for seed in 42; do 
CUDA_VISIBLE_DEVICES=$GPU_ID  python3  run_acener.py  --model_type bertspanmarker  \
    --model_name_or_path  bert_models/bert-base-uncased  --do_lower_case  \
    --data_dir radgraph  \
    --learning_rate 2e-5  --num_train_epochs 50  --per_gpu_train_batch_size  8  --per_gpu_eval_batch_size 16  --gradient_accumulation_steps 1  \
    --max_seq_length 512  --save_steps 200  --max_pair_length 256  --max_mention_ori_length 8    \
    --do_train  --do_eval  --evaluate_during_training   --eval_all_checkpoints  \
    --fp16  --seed $seed  --onedropout  --lminit  \
    --train_file train.json --dev_file dev.json --test_file test.json  \
    --output_dir radgraph_models/PL-Marker-radgraph-base-ner-$seed  --overwrite_output_dir  --output_results
done;

touch radgraph_models/run_train_ner_radgraph_base_done

# Average the scores
# python3 sumup.py radgraph PL-Marker-ace05-bert

