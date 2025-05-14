

python main.py ../RadianceFieldStudio/data/stanford_orb/blender/cactus_scene001 --workspace IR_outputs/orb_cactus1 -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 --background random && \
python main.py ../RadianceFieldStudio/data/stanford_orb/blender/cactus_scene001 --workspace IR_outputs/orb_cactus1 -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.02 --lambda_ks 0.0001 --lambda_normal 0.0003 --lambda_edgelen 0.1 --lambda_nrm 0.0007 --lambda_rgb_brdf 0.05
