# ./runtrain.sh config dataset_path manifest_id model_id
# dataset_path = path to csv files.
# manifest_id = csv prefix,  -> ${dataset_path}/train_${manifest_id}.csv
# model_id = name for model file, models/${model_id}.pth


## Quartets models DONE! First experiments.
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi quartets quartets_multi
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi_splits quartets quartets_multi_splits
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_single quartets quartets_single
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_single_splits quartets quartets_single_splits

## Sonatas models
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi sonatas_multi
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_splits sonatas_multi_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_single sonatas_single
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_single_splits sonatas_single_splits

# Combined Quartets + Sonatas models
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_multi combined_multi
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_multi_splits combined_multi_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_single combined_single
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_single_splits combined_single_splits

#########################################################################################################

# ## Quartets models - extended encoders: PENDING!!
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi_ext quartets quartets_multi_ext
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi_ext_splits quartets quartets_multi_ext_splits
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_single_ext quartets quartets_single_ext
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_single_ext_splits quartets quartets_single_ext_splits

## Sonatas models - extended encoders
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_ext sonatas_multi_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_ext_splits sonatas_multi_ext_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_single_ext sonatas_single_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_single_ext_splits sonatas_single_ext_splits

## Combined Quartets + Sonatas models - extended encoders
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_multi_ext combined_multi_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_multi_ext_splits combined_multi_ext_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_single_ext combined_single_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep combined_single_ext_splits combined_single_ext_splits
