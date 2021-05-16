## Combine datasets: output in datadir, files train_<id>_<label_encoder[_splits]>


# # Combine Sonatas all authors, datasets per prep config. 
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi_ext --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2 --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2_ext --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi -rs --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi_ext -rs --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2 -rs --id sonatas
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2_ext -rs --id sonatas

# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2_ext --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2_ext
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2 --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi_ext --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi_ext
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi

# # Combine Quartets + Sonatas, all authors, datasets per prep config. 
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi_ext
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi2
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi2_ext
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi -rs
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi_ext -rs
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi2 -rs
# python combine_dataset.py -d ../datasets/prep/ --id all -le multi2_ext -rs

# ######################################################################################################################

# ## Sonatas models
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi sonatas_multi

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi.pth

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi.pth

# ######################################################################################################

# ## Combined models
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi all_multi

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi.pth

# ######################################################################################################
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_splits sonatas_multi_splits

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi_splits.pth


# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi_splits.pth

# ######################################################################################################
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi_splits all_multi_splits

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi_splits.pth

# ######################################################################################################
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2 sonatas_multi2

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2.pth

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi2.pth

# ######################################################################################################
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2 all_multi2

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi2.pth

# ######################################################################################################
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_splits sonatas_multi2_splits

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2_splits.pth

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi2_splits.pth

# ######################################################################################################
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2_splits all_multi2_splits

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi2_splits.pth

# ######################################################################################################

# ## Sonatas models - extended encoders
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_ext sonatas_multi_ext

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi_ext.pth

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi_ext.pth

# ######################################################################################################

# ## all models - extended encoders
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi_ext all_multi_ext

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi_ext.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi_ext.pth

# ######################################################################################################

# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi_ext_splits sonatas_multi_ext_splits

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi_ext_splits.pth

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi_ext_splits.pth

# ######################################################################################################

# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi_ext_splits all_multi_ext_splits

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi_ext_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi_ext_splits.pth

######################################################################################################

# COMMENTS FROM HERE ARE LOW PRIORITY TESTS over extended vocab quartets datasets.


## MISSING TEST on quartets datasets for above models.

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi2.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi_splits.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi2_splits.pth


./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi2.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi2.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi_splits.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi2_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi2_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi2_splits.pth


./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi_ext.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi_ext_splits.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi_ext.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi_ext_splits.pth

######################################################################################################


./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2_ext all_multi2_ext

./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2_ext.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi2_ext.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi2_ext.pth

######################################################################################################

./runtrain.sh ./configs/sonatas.cfg ../datasets/prep all_multi2_ext_splits all_multi2_ext_splits

./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/all_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/all_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/all_multi2_ext_splits.pth

######################################################################################################

# Training interruption --> continue from last checkpoint model.
# ./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_ext sonatas_multi2_ext
./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_ext sonatas_multi2_ext --continue-from ./models/sonatas_multi2_ext.last.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext.pth

./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi2_ext.pth

./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi2_ext.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi2_ext.pth

######################################################################################################

./runtrain.sh ./configs/sonatas.cfg ../datasets/prep/sonatas sonatas_multi2_ext_splits sonatas_multi2_ext_splits

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/sonatas_multi2_ext_splits.pth


./runtest.sh ../datasets/prep/quartets/quartets_multi/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi_splits/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
./runtest.sh ../datasets/prep/quartets/quartets_multi2_splits/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi_ext_splits/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/test_quartets.csv ./models/sonatas_multi2_ext_splits.pth
# ./runtest.sh ../datasets/prep/quartets/quartets_multi2_ext_splits/val_quartets.csv ./models/sonatas_multi2_ext_splits.pth

######################################################################################################


# ## Tests for quartets models against the all and sonatas datasets. TO BE DONE LATER, LOW PRIORITY ALSO.
# # Comments are tests already made. Note there are not extended vocab quartets models, so no tests.

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/quartets_multi.pth

# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi.pth


# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/quartets_multi2.pth

# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi2.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi2.pth


# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/quartets_multi_splits.pth

# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi_splits.pth

# ./runtest.sh ../datasets/prep/test_all_multi.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/quartets_multi2_splits.pth

# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi2_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi2_splits.pth
# # ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi2_splits.pth