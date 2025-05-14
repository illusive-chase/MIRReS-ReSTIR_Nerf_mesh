# sb_lst='ball car coffee'
sb_lst='ball car coffee helmet teapot toaster'

for i in $sb_lst
do
    python main.py ../RadianceFieldStudio/data/refnerf_blender/${i} --workspace IR_outputs/sb_${i} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --test --test_no_mesh --spp 128 --test_no_eval
done
