model=openchat/openchat_3.5
volume=$PWD/data
port=46545

export USE_FLASH_ATTENTION=false
export SHARDED=false
export CUDA_VISIBLE_DEVICES=3

docker run --shm-size 16g --name openchat_tgi_gpu3 -e USE_FLASH_ATTENTION -e SHARDED -e CUDA_VISIBLE_DEVICES --gpus all -p $port:80 -v $volume:/data text-generation-inference:non-flash --model-id $model --dtype float16 --disable-custom-kernels --trust-remote-code
