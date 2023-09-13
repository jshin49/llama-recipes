token=$1
model=$2
# model=meta-llama/Llama-2-7b-chat-hf
num_shard=1
volume=data
port=3001

docker run --gpus '"device=3"' \
    --shm-size 1g \
    -e HUGGING_FACE_HUB_TOKEN=$token \
    -p $port:80 \
    -v "/home/seungone/hf_cache":/hf_cache \
    -v $PWD:$PWD ghcr.io/huggingface/text-generation-inference:latest \
    --model-id $model \
    --num-shard $num_shard \
    --huggingface-hub-cache "/hf_cache" \
    --max-input-length 3072 \
    --max-total-tokens 4096 \
    --max-batch-total-tokens 10000 \
    --max-concurrent-requests 10 \
    --dtype "bfloat16" \
    --json-output