# ./runtrain.sh config dataset_path manifest_id model_id
# dataset_path = path to csv files.
# manifest_id = csv prefix,  -> ${dataset_path}/train_${manifest_id}.csv
# model_id = name for model file, models/${model_id}.pth


## Quartets models DONE! First experiments.
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi quartets quartets_multi
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi_splits quartets quartets_multi_splits
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi2 quartets quartets_multi2
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi2_splits quartets quartets_multi2_splits

## Sonatas models
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi sonatas_multi
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_splits sonatas_multi_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2 sonatas_multi2
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_splits sonatas_multi2_splits

# Combined Quartets + Sonatas models
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi all_multi
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi_splits all_multi_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2 all_multi2
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2_splits all_multi2_splits

#########################################################################################################

# ## Quartets models - extended encoders: PENDING!!
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi_ext quartets quartets_multi_ext
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi_ext_splits quartets quartets_multi_ext_splits
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi2_ext quartets quartets_multi2_ext
# ./runtrain.sh ./configs/quartets.cfg ../datasets/prep/quartets/quartets_multi2_ext_splits quartets quartets_multi2_ext_splits

## Sonatas models - extended encoders
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_ext sonatas_multi_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_ext_splits sonatas_multi_ext_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_ext sonatas_multi2_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_ext_splits sonatas_multi2_ext_splits

## Combined Quartets + Sonatas models - extended encoders
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi_ext all_multi_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi_ext_splits all_multi_ext_splits
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2_ext all_multi2_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2_ext_splits all_multi2_ext_splits
