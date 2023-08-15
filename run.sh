# 13B full fine-tuning
CUDA_VISIBLE_DEVICES=4,5,6,7 torchrun --nnodes 1 --nproc_per_node 4  llama_finetuning.py --enable_fsdp --pure_bf16 --model_name meta-llama/Llama-2-13b-chat-hf --hf_cache_dir /home/seungone/hf_cache --batch_size_training 4 --micro_batch_size 4 --dist_checkpoint_root_folder model_checkpoints --dist_checkpoint_folder fine-tuned --use_fast_kernel

# 70B full
CUDA_VISIBLE_DEVICES=4,5,6,7 torchrun --nnodes 1 --nproc_per_node 4  llama_finetuning.py --enable_fsdp --pure_bf16 --model_name meta-llama/Llama-2-70b-chat-hf --hf_cache_dir /home/seungone/hf_cache --batch_size_training 4 --micro_batch_size 4 --dist_checkpoint_root_folder model_checkpoints --dist_checkpoint_folder fine-tuned --use_fast_kernel

# 70B LoRA 
CUDA_VISIBLE_DEVICES=4,5,6,7 torchrun --nnodes 1 --nproc_per_node 4  llama_finetuning.py --enable_fsdp --pure_bf16 --model_name meta-llama/Llama-2-70b-chat-hf --use_peft --peft_method lora --output_dir lora_ckpts --hf_cache_dir /home/seungone/hf_cache --use_fast_kernels