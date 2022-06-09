CURRENT_DIR=$(cd "$(dirname "$0")";pwd)
git clone https://github.com/SmallPigPeppa/mover.git
cd "$PWD"/mover/preprocess/pare



pare_model="$PWD"/hrnet_model
video_file="$PWD"/Color_flip.mp4
out_dir="$PWD"/Color_flip-out

source activate pare-env
python demo.py \
       --cfg ${pare_model}/config.yaml \
       --ckpt ${pare_model}/checkpoint.ckpt \
       --output_folder ${out_dir} \
       --vid_file ${video_file} \
       --draw_keypoints \
       --detector maskrcnn
