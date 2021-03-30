if [[ $# -lt 3 ]] ; then
    echo 'missing arguments: ./runtrain.sh config dataset_path manifest_id model_id [args]'
    exit -1
fi
config=$1
dataset_path=$2
manid=$3
modid=$4
shift 4
# Or python -m multiproc for multi-GPU training 
python train.py --cuda --config-path ${config} --train-manifest ${dataset_path}/train_${manid}.csv --val-manifest ${dataset_path}/val_${manid}.csv --labels-path ${dataset_path}/labels_${manid}.json --num-workers 4 --model-path models/${modid}.pth $*
