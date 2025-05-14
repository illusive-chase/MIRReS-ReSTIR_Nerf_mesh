envmap='bridge city forest fireplace night'

# case='lego'
# for i in $envmap
# do
# python main.py ../RadianceFieldStudio/data/tensoir/${case} --workspace IR_outputs/ir_${case} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --test --test_no_mesh --spp 128 --albedo_scale_x 0.97303425 --albedo_scale_y 0.84193267 --albedo_scale_z 0.62559443 --envmap_path ../RadianceFieldStudio/data/tensoir/${i}.hdr --save_path IR_outputs/ir_${case}/${i} --test_no_eval
# done

case='ficus'
for i in $envmap
do
python main.py ../RadianceFieldStudio/data/tensoir/${case} --workspace IR_outputs/ir_${case} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --test --test_no_mesh --spp 128 --albedo_scale_x 0.94099746 --albedo_scale_y 0.799002 --albedo_scale_z 0.77791238 --envmap_path ../RadianceFieldStudio/data/tensoir/${i}.hdr --save_path IR_outputs/ir_${case}/${i} --test_no_eval
done

case='hotdog'
for i in $envmap
do
python main.py ../RadianceFieldStudio/data/tensoir/${case} --workspace IR_outputs/ir_${case} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --test --test_no_mesh --spp 128 --albedo_scale_x 1.50075777 --albedo_scale_y 1.26512125 --albedo_scale_z 0.81547266 --envmap_path ../RadianceFieldStudio/data/tensoir/${i}.hdr --save_path IR_outputs/ir_${case}/${i} --test_no_eval
done

case='arm'
for i in $envmap
do
python main.py ../RadianceFieldStudio/data/tensoir/armadillo --workspace IR_outputs/ir_${case} -O --bound 1 --scale 0.8 --dt_gamma 0 --stage 1 --use_brdf --use_restir --test --test_no_mesh --spp 128 --albedo_scale_x 0.68059171 --albedo_scale_y 0.59509149 --albedo_scale_z 0.35474147 --envmap_path ../RadianceFieldStudio/data/tensoir/${i}.hdr --save_path IR_outputs/ir_${case}/${i} --test_no_eval
done
