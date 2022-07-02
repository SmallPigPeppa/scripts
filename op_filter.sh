## run OneEuro Filter
#video_n=Color_flip
#input_dir=/ps/scratch/hyi/HCI_dataset/20210209_experiments/PROX_sample/N3OpenArea_00157_02
## ${video_n}_rename_openpose
## root_use=/ps/scratch/hyi/HCI_dataset/20210209_experiments/PROX_sample/N3OpenArea_00157_02/mv_smplifyx_input_withPARE_PARE3DJointOneConfidence_OP2DJoints
#img_dir=${input_dir}/Color_flip_rename
#save_dir=/ps/scratch/hyi/HCI_dataset/20210209_experiments/PROX_sample/N3OpenArea_00157_02/mv_smplifyx_input_withPARE_PARE3DJointOneConfidence_OP2DJoints_openpose_filter
#python /is/cluster/hyi/workspace/HCI/footskate_reducer/ground_detector/op_filter_json.py \
#        --root=${input_dir}/${video_n}_rename_openpose \
#        --dump=${save_dir} \
#        --img_dir=${img_dir} \
#        --viz=True


conda activate pare-env
cd /root/code/mover/preprocess/footskate_reducer/ground_detector
python op_filter_json.py \
--root /root/code/mover/preprocess/Color_flip/Color_flip_openpose \
--dump /root/code/mover/preprocess/Color_flip/mv_smplifyx_input_withPARE_PARE3DJointOneConfidence_OP2DJoints_openpose_filter \
--image_dir  /root/code/mover/preprocess/Color_flip/Color_flip_frames \
--viz=True

cd /root/code/scripts