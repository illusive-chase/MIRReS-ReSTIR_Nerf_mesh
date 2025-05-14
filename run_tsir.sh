python main.py ../RadianceFieldStudio/data/tensoir/armadillo --workspace IR_outputs/ir_arm/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 && \
python main.py ../RadianceFieldStudio/data/tensoir/armadillo --workspace IR_outputs/ir_arm/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.022 --lambda_ks 0.000055 --lambda_normal 0.0001 --lambda_rgb_brdf 0.07 --learning_rate_lgt 0.09 --roughness_min 0.16 --spp 48

python main.py ../RadianceFieldStudio/data/tensoir/ficus --workspace IR_outputs/ir_ficus/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 && \
python main.py ../RadianceFieldStudio/data/tensoir/ficus --workspace IR_outputs/ir_ficus/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.028 --lambda_normal 0.001 --lambda_edgelen 0.1 --lambda_rgb_brdf 0.1 --learning_rate_lgt 0.03 --lambda_ks 0.001 --roughness_min 0.3 --spp 64

python main.py ../RadianceFieldStudio/data/tensoir/hotdog --workspace IR_outputs/ir_hotdog/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 && \
python main.py ../RadianceFieldStudio/data/tensoir/hotdog --workspace IR_outputs/ir_hotdog/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.02 --lambda_ks 0.0001 --lambda_normal 0.0003 --lambda_edgelen 0.1 --lambda_nrm 0.001 --lambda_rgb_brdf 0.05 --lambda_offsets 0.9

python main.py ../RadianceFieldStudio/data/tensoir/lego --workspace IR_outputs/ir_lego/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 0 --lambda_tv 1e-8 --iters 50000 && \
python main.py ../RadianceFieldStudio/data/tensoir/lego --workspace IR_outputs/ir_lego/ -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --lambda_kd 0.017 --lambda_ks 0.0001 --lambda_normal 0.0001 --lambda_edgelen 0.1 --lambda_nrm 0.00035 --lambda_rgb_brdf 0.05 --lambda_brdf_diffuse 0.002 --lambda_brdf_specular 0.00003