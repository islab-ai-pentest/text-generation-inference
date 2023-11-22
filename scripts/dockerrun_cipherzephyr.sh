model=/data/cipher_zephyrb_7b_v1.1
port=46540
volume=/raid/pentesting/pentesting_lm/models

export USE_FLASH_ATTENTION=false
export SHARDED=false
export CUDA_VISIBLE_DEVICES=1

docker run --name cipher_zephyr7b_gpu1_tgi --shm-size 16g -e USE_FLASH_ATTENTION -e SHARDED -e CUDA_VISIBLE_DEVICES --gpus all -p $post:80 -v $volume:/data text-generation-inference:non-flash --model-id $model --dtype float16 --disable-custom-kernels --trust-remote-code
