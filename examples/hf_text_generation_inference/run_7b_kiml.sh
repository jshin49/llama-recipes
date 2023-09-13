model=/kiml_ckpts/7b-wo/hf
num_shard=2
volume=data
port=$1

docker run --gpus '"device=0,1"' \
    --shm-size 1g \
    -e HUGGING_FACE_HUB_TOKEN=$token \
    -p $port:80 \
    -v "/home/seungone/hf_cache":/hf_cache \
    -v "/home/seungone/kiml_ckpts":/kiml_ckpts \
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