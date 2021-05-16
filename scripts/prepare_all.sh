# ./prep<data>.sh id datadir outdir --label-encoder <label_encoder> [--remove-splits]
# Take all kern inside the datadir, and output in outdir/<id>_<label_encoder[_splits]>/train_<id>.csv, etc.

## Quartets: Already combined, datasets per prep config:

# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder single_ext --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder single_ext
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder single --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder single
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi_ext --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi_ext
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi

######################################################################################################################

## Sonatas: Not combined, independent authors, datasets per prep config:

# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder single_ext --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder single_ext
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder single --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder single
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi_ext --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi_ext
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi

# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder single_ext --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder single_ext
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder single --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder single
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi_ext --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi_ext
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi

# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder single_ext --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder single_ext
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder single --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder single
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi_ext --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi_ext
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi

# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder single_ext --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder single_ext --instruments piano,piano 
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder single --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder single --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi_ext --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi_ext --instruments piano,piano 
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi --instruments piano,piano

######################################################################################################################

## Combine datasets: output in datadir, files train_<id>_<label_encoder[_splits]>

# Combine Sonatas all authors, datasets per prep config. 
python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi_ext --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le single --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le single_ext --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi -rs --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi_ext -rs --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le single -rs --id sonatas
python combine_dataset.py -d ../datasets/prep/sonatas/ -le single_ext -rs --id sonatas

# Combine Quartets + Sonatas, all authors, datasets per prep config. 
python combine_dataset.py -d ../datasets/prep/ --id all -le multi
python combine_dataset.py -d ../datasets/prep/ --id all -le multi_ext
python combine_dataset.py -d ../datasets/prep/ --id all -le single
python combine_dataset.py -d ../datasets/prep/ --id all -le single_ext
python combine_dataset.py -d ../datasets/prep/ --id all -le multi -rs
python combine_dataset.py -d ../datasets/prep/ --id all -le multi_ext -rs
python combine_dataset.py -d ../datasets/prep/ --id all -le single -rs
python combine_dataset.py -d ../datasets/prep/ --id all -le single_ext -rs
