
#DATA_FOLDER='/ps/scratch/hyi/HCI_dataset/20210209_experiments/PROX_sample/N3OpenArea_00157_02/Color_flip_rename'
DATA_FOLDER='/root/code/mover/preprocess/input_data/Color_flip/imgs'
OUTPUT_FOLDER='/root/code/mover/preprocess/out_data/test'
#JSON_FOLDER="/ps/scratch/hyi/HCI_dataset/20210209_experiments/PROX_sample/N3OpenArea_00157_02/openpose_filter/Color_flip_rename_openpose"
JSON_FOLDER="/root/code/mover/preprocess/Color_flip/Color_flip_openpose"
#pare_result='/ps/scratch/hyi/HCI_dataset/20210209_experiments/PROX_sample/N3OpenArea_00157_02/pare/pare_output.pkl'
pare_result='/root/code/mover/preprocess/Color_flip/pare_output.pkl'
# not use
cam_dir='/root/code/mover/smplifyx_cam'
# ! end
echo ${DATA_FOLDER}
echo ${OUTPUT_FOLDER}
#MODEL_FOLDER=/ps/scratch/ps_shared/mkocabas/pare_results/data/body_models
#VPOSER_FOLDER=/lustre/home/hyi/workspace/Multi-IOI/multiview_smplifyx/smpl-x_model/vposer_v1_0
#MODEL_FOLDER=/root/code/mover/body_models
MODEL_FOLDER=/root/code/mover/preprocess/pare/data/body_models
VPOSER_FOLDER=/root/code/mover/smplifyx-file/vposer_v1_0
#source /is/cluster/hyi/venv/smplify/bin/activate
cd /root/code/mover/preprocess/pre_pare_scripts/
#source activate pare-env
source activate smplifyx
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