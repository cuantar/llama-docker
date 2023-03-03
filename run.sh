#!/bin/bash
export TARGET_FOLDER=/data/weights
export CUDA_VISIBLE_DEVICES=0
export PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.6,max_split_size_mb:128
torchrun --nproc_per_node 1 example.py \
	--ckpt_dir $TARGET_FOLDER/7B \
	--tokenizer_path $TARGET_FOLDER/tokenizer.model
