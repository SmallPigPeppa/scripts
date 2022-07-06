#!/bin/bash
# export EGL_DEVICE_ID=$GPU_DEVICE_ORDINAL
# echo $EGL_DEVICE_ID
# pid=$(printf "%06d" $1)
# echo ${pid}
# modify
batch_size=2049
# img_list=`expr "$1" + "2"`
img_list=$1
#INPUT_DATA="/is/cluster/hyi/workspace/SceneGeneration/smplify-x_modify/debug/smplify_video_input/"
#INPUT_DATA="/root/code/mover/preprocess/Color_flip/Color_flip_frames"
#DATA_FOLDER=${INPUT_DATA}/"mv_smplifyx_input_OneEuroFilter_PARE_PARE3DJointOneConfidence_OP2DJoints"
#DATA_FOLDER="/root/code/mover/preprocess/Color_flip/OneEuro_filter_mv_smplifyx_input_withPARE_PARE3DJointOneConfidence_OP2DJoints"
DATA_FOLDER="/root/code/mover/preprocess/out_data/Color_flip/op2smplifyx_withPARE_PARE3DJointOneConfidence_OP2DJoints"
#OUTPUT_FOLDER="/root/code/mover/preprocess/Color_flip/mover_results"
OUTPUT_FOLDER="/root/code/mover/preprocess/out_data/Color_flip/modified_smplifyx"
#CALIBRATION_FOLDER=${INPUT_DATA}/smplifyx_cam
CALIBRATION_FOLDER=/root/code/smplify-x_modify/smplify_video_input/smplifyx_cam
#CONFIG_FILE=/is/cluster/hyi/workspace/SceneGeneration/smplify-x_modify/body_models/cfg_files/fit_smplx_video.yaml
CONFIG_FILE=/root/code/mover/body_models/cfg_files/fit_smplx_video.yaml
# end of modify
echo ${DATA_FOLDER}
echo ${OUTPUT_FOLDER}
# --cam_inc_fn ${cam_inc_fn} \
#MODEL_FOLDER=/is/cluster/hyi/workspace/Multi-IOI/multiview_smplifyx/smpl-x_model/models
#VPOSER_FOLDER=/is/cluster/hyi/workspace/Multi-IOI/multiview_smplifyx/smpl-x_model/vposer_v1_0
MODEL_FOLDER=/root/code/smplify-x_modify/models
VPOSER_FOLDER=/root/code/smplify-x_modify/vposer_v1_0

conda activate mover
cd /root/code/mover
# first opt 3D joint on 3D skeletons
# Then opt in [start_opt_stage, end_opt_stage): focus on hands.

# cd /is/cluster/hyi/workspace/SceneGeneration/smplify-x_modify/
# export PYTHONPATH=/is/cluster/hyi/workspace/SceneGeneration/smplify-x_modify:${PYTHONPATH}
# python body_models/video_smplifyx/main_video.py \
# ! save_meshes=True: save mesh and rendered images.

python main.py \
    --single "False" \
    --config ${CONFIG_FILE} \
    --img_list -1 \
    --batch_size ${batch_size} \
    --data_folder ${DATA_FOLDER} \
    --output_folder ${OUTPUT_FOLDER} \
    --visualize="False" \
    --save_meshes=True \
    --model_folder ${MODEL_FOLDER} \
    --model_type 'smplx' \
    --pre_load="False" \
    --pre_load_pare_pose="False" \
    --vposer_ckpt ${VPOSER_FOLDER} \
    --part_segm_fn /root/code/smplify-x_modify/smplx_parts_segm.pkl \
    --camera_type "user" \
    --gender 'male' \
    --use_video "True" \
    --calib_path ${CALIBRATION_FOLDER} \
    --start_opt_stage 3 \
    --end_opt_stage 5 \


cd /root/code/scripts

