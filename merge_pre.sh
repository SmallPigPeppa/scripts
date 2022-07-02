conda activate pare-env


cd /root/code/mover/preprocess/merge_preprocess/
pare_model=/root/code/mover/preprocess/pare/hrnet_model
video_file=/root/code/mover/preprocess/pare/Color_flip.mp4
out_dir=/root/code/mover/preprocess/merge_preprocess/Color_flip-out









python demo.py \
       --cfg ${pare_model}/config.yaml \
       --ckpt ${pare_model}/checkpoint.ckpt \
       --output_folder ${out_dir} \
       --vid_file ${video_file} \
       --draw_keypoints \
       --detector maskrcnn


DATA_FOLDER='/root/code/mover/preprocess/Color_flip/Color_flip_frames'
OUTPUT_FOLDER="/root/code/mover/preprocess/Color_flip_merge/OneEuro_filter_mv_smplifyx_input_withPARE"
JSON_FOLDER="/root/code/mover/preprocess/Color_flip/Color_flip_openpose"
pare_result='/root/code/mover/preprocess/Color_flip/pare_output.pkl'
cam_dir='/root/code/mover/smplifyx_cam'

echo ${DATA_FOLDER}
echo ${OUTPUT_FOLDER}

MODEL_FOLDER=/root/code/mover/preprocess/pare/data/body_models
VPOSER_FOLDER=/root/code/mover/smplifyx-file/vposer_v1_0

#cd /root/code/mover/preprocess/merge_preprocess/
#source activate pare-env
#source activate smplifyx
python demo_pare_result.py \
    --config ./cfg_files/fit_smpl.yaml \
    --export_mesh True \
    --save_new_json True \
    --json_folder  ${JSON_FOLDER} \
    --data_folder ${DATA_FOLDER} \
    --output_folder ${OUTPUT_FOLDER} \
    --pare_result ${pare_result} \
    --cam_dir ${cam_dir} \
    --visualize="False" \
    --model_folder ${MODEL_FOLDER} \
    --vposer_ckpt ${VPOSER_FOLDER} \
    --part_segm_fn /root/code/mover/smplifyx-file/smplx_parts_segm.pkl \
    --gender male \
    --check_inverse_feet="False" \


cd /root/code/scripts