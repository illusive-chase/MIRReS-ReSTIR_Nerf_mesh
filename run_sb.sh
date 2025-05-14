sb_lst='helmet teapot toaster'
# sb_lst='ball car coffee helmet teapot toaster'

python main.py ../RadianceFieldStudio/data/refnerf_blender/car --workspace IR_outputs/sb_car_ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 --background random && \
python main.py ../RadianceFieldStudio/data/refnerf_blender/car --workspace IR_outputs/sb_car_ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.02 --lambda_ks 0.0001 --lambda_normal 0.0003 --lambda_edgelen 0.1 --lambda_nrm 0.0007 --lambda_rgb_brdf 0.05

for i in $sb_lst
do
    # python ../RadianceFieldStudio/tests/data/test_dataset_dump.py mvs2blender --dataset.path ../RadianceFieldStudio/data/refnerf/${i} --output ../RadianceFieldStudio/data/refnerf_blender/${i} && \
    python main.py ../RadianceFieldStudio/data/refnerf_blender/${i} --workspace IR_outputs/sb_${i} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 --background random --me_max 0.2 && \
    python main.py ../RadianceFieldStudio/data/refnerf_blender/${i} --workspace IR_outputs/sb_${i} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.02 --lambda_ks 0.0001 --lambda_normal 0.0003 --lambda_edgelen 0.1 --lambda_nrm 0.0007 --lambda_rgb_brdf 0.05 --me_max 0.2
done
