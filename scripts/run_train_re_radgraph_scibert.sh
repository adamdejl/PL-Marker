
GPU_ID=0

# SciERC,  --use_ner_results: use the original entity type predicted by NER models
mkdir radgraph_models
# --use_ner_results \
for seed in 42; do 
CUDA_VISIBLE_DEVICES=$GPU_ID  python3  run_re.py  --model_type bertsub  \
    --model_name_or_path  bert_models/scibert-uncased  --do_lower_case  \
    --data_dir radgraph  \
    --learning_rate 2e-5  --num_train_epochs 10  --per_gpu_train_batch_size  8  --per_gpu_eval_batch_size 16  --gradient_accumulation_steps 1  \
    --max_seq_length 256  --max_pair_length 16  --save_steps 200  \
    --do_train  --do_eval  --evaluate_during_training   --eval_all_checkpoints  --eval_logsoftmax  \
    --fp16  --seed $seed      \
    --train_file train.json --dev_file dev.json --test_file test.json  \
    --output_dir radgraph_models/PL-Marker-radgraph-scibert-re-$seed  --overwrite_output_dir
done;

touch radgraph_models/run_train_re_radgraph_scibert_done

# Average the scores
#python3 sumup.py scire scire-scibert