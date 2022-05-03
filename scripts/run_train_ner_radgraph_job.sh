#!/bin/bash
#SBATCH -c 1                               # Request one core
#SBATCH -t 0-06:00                         # Runtime in D-HH:MM format
#SBATCH -p gpu_quad                        # Partition to run in
#SBATCH --mem=16G                          # Memory total in MiB (for all cores)
#SBATCH -o run_train_ner_radgraph_scibert_%j.out   # File to which STDOUT will be written, including job ID (%j)
#SBATCH -e run_train_ner_radgraph_scibert_%j.err   # File to which STDERR will be written, including job ID (%j)
#SBATCH --gres=gpu:1                       # Request 1 GPU
                                           # You can change the filenames given with -o and -e to any filenames you'd like

# You can change hostname to any command you would like to run
bash /n/data1/hms/dbmi/rajpurkar/lab/home/ad461/project/radgraph/PL-Marker/scripts/run_train_ner_radgraph_scibert.sh
