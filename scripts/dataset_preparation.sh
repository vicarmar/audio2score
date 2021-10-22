if [[ $# -lt 1 ]] ; then
    echo 'missing arguments: ./data_preparation.sh datasets_dest_folder'
    exit -1
fi

cd $1

# We should be now inside datasets global folder. 
echo "Preparing folder structure..."
mkdir datasets_src 
mkdir datasets_prep
pushd datasets_src

# Inside datasets/datasets_src folder: Clone src kern repositories.

# Quartets
mkdir quartets 
pushd quartets
echo "Cloning quartets repositories into $(pwd)..."

sudo git clone https://github.com/craigsapp/beethoven-string-quartets.git
sudo git clone https://github.com/musedata/humdrum-haydn-quartets.git
sudo git clone https://github.com/musedata/humdrum-mozart-quartets.git

popd

# Sonatas
mkdir sonatas 
pushd sonatas
echo "Cloning sonatas repositories into $(pwd)..."

sudo git clone https://github.com/craigsapp/beethoven-piano-sonatas.git
sudo git clone https://github.com/craigsapp/haydn-piano-sonatas.git
sudo git clone https://github.com/craigsapp/mozart-piano-sonatas.git
sudo git clone https://github.com/craigsapp/scarlatti-keyboard-sonatas.git

popd # We are again in datasets/datasets_src
popd # We are again in datasets

# Prepare quartets individually and combine into full quartets dataset
echo "Preparing quartets..."
a2s-prepare-quartets --id beethoven-quartets --data-dir ./datasets_src/quartets/beethoven-string-quartets --out-dir ./datasets_prep/quartets/beethoven-string-quartets
a2s-prepare-quartets --id haydn-quartets --data-dir ./datasets_src/quartets/humdrum-haydn-quartets --out-dir ./datasets_prep/quartets/humdrum-haydn-quartets
a2s-prepare-quartets --id mozart-quartets --data-dir ./datasets_src/quartets/humdrum-mozart-quartets --out-dir ./datasets_prep/quartets/humdrum-mozart-quartets

echo "Combining quartets..."
a2s-combine-dataset --id quartets --data-dir ./datasets_prep/quartets

# Prepare sonatas individually and combine into full sonatas dataset
echo "Preparing sonatas..."

a2s-prepare-sonatas --id beethoven-sonatas --data-dir ./datasets_src/sonatas/beethoven-piano-sonatas --out-dir ./datasets_prep/sonatas/beethoven-piano-sonatas
a2s-prepare-sonatas --id haydn-sonatas --data-dir ./datasets_src/sonatas/haydn-piano-sonatas --out-dir ./datasets_prep/sonatas/haydn-piano-sonatas
a2s-prepare-sonatas --id mozart-sonatas --data-dir ./datasets_src/sonatas/mozart-piano-sonatas --out-dir ./datasets_prep/sonatas/mozart-piano-sonatas
a2s-prepare-sonatas --id scarlatti-sonatas --data-dir ./datasets_src/sonatas/scarlatti-keyboard-sonatas --out-dir ./datasets_prep/sonatas/scarlatti-keyboard-sonatas

echo "Combining sonatas..."
a2s-combine-dataset --id sonatas --data-dir ./datasets_prep/sonatas 

# Combine sonatas and quartets into full "combined" dataset
echo "Combining sonatas + quartets into combined dataset..."
a2s-combine-dataset --id combined --data-dir ./datasets_prep

