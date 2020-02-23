GPUs=$1
eval_output_dir=$2
LINREG_NAME=$3
#cityscapes_iouconf_mcdropout
python train_linreg.py --name $LINREG_NAME --dataset_mode iouentropy \
                --dataroot ./cityscapes \
                --image_src_dir ./$eval_output_dir/cityscapes/leftImg8bitResize/train \
                --image_rec_dir ./$eval_output_dir/cityscapes/leftImg8bitRec/train \
                --iou_dir ./$eval_output_dir/metrics_trainccv \
                --entropy_dir ./$eval_output_dir/metrics_trainccv_mcd \
                --pred_dir ./$eval_output_dir/cityscapes/gtFinePredProb/train \
                --label_nc 19 --no_instance \
                --use_vae \
                --vgg_norm \
                --batchSize 4 \
                --lr 2e-4 \
                --niter 20000 \
                --snapshot 5000 \
                --gpu_ids $GPUs

                #--conf_map_dir ./$eval_output_dir/cityscapes/gtFinePred_mcdropout/val \