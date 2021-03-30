# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2_ext --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2_ext
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2 --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi2
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi_ext --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi_ext
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi --remove-splits
# ./prepquartets.sh quartets ../datasets/src/quartets ../datasets/prep/quartets --label-encoder multi


# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi2_ext --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi2_ext
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi2 --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi2
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi_ext --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi_ext
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi --remove-splits
# ./prepsonatas.sh beethoven-sonatas ../datasets/src/sonatas/beethoven-piano-sonatas ../datasets/prep/sonatas/beethoven-piano-sonatas --label-encoder multi

# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi2_ext --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi2_ext
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi2 --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi2
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi_ext --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi_ext
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi --remove-splits
# ./prepsonatas.sh haydn-sonatas ../datasets/src/sonatas/haydn-piano-sonatas ../datasets/prep/sonatas/haydn-piano-sonatas --label-encoder multi

# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi2_ext --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi2_ext
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi2 --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi2
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi_ext --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi_ext
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi --remove-splits
# ./prepsonatas.sh mozart-sonatas ../datasets/src/sonatas/mozart-piano-sonatas ../datasets/prep/sonatas/mozart-piano-sonatas --label-encoder multi

# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi2_ext --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi2_ext --instruments piano,piano 
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi2 --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi2 --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi_ext --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi_ext --instruments piano,piano 
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi --remove-splits --instruments piano,piano
# ./prepsonatas.sh scarlatti-sonatas ../datasets/src/sonatas/scarlatti-keyboard-sonatas ../datasets/prep/sonatas/scarlatti-keyboard-sonatas --label-encoder multi --instruments piano,piano


# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi_ext
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2_ext
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi -rs
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi_ext -rs
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2 -rs
# python combine_dataset.py -d ../datasets/prep/sonatas/ -le multi2_ext -rs
