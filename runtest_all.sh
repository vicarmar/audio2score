######### Crossed tests 
# (each model trained with a data preparation VS test/val datasets of each data preparation)

# PENDING: CROSSED DATASETS experiments.
#  TEST QUARTETS vs SONATAS DATASETS
#  TEST QUARTETS vs COMBINED DATASETS

#  TEST SONATAS vs QUARTETS DATASETS
#  TEST SONATAS vs COMBINED DATASETS

#  TEST COMBINED vs SONATAS DATASETS
#  TEST COMBINED vs QUARTETS DATASETS

# NEED Training for extended models for quartets... and all testing for them...

#######################################################################################################3
#######################################################################################################3
## QUARTET MODELS.

## Quartet not extended models
## APPLIED to quartet not extended datasets

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/test_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/test_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/test_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/test_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/val_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2/val_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/test_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/test_quartets.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/val_quartets.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi2_splits/val_quartets.csv ./models/quartets_multi2_splits.pth

## Quartet not extended models
## APPLIED to quartet EXTENDED datasets
## PENDING....

# ###########################################################################################################
## Quartet EXTENDED models
## APPLIED to quartet not extended datasets
## PENDING....

## Quartet EXTENDED models
## APPLIED to quartet EXTENDED datasets
## PENDING....


#######################################################################################################3
#######################################################################################################3
## SONATAS MODELS.

## Sonatas not extended models
## APPLIED to sonatas not extended datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2_splits.pth

## Sonatas not extended models
## APPLIED to sonatas EXTENDED datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2_splits.pth

# ###########################################################################################################
## Sonatas EXTENDED models
## APPLIED to sonatas not extended datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/sonatas_multi2_ext_splits.pth

## Sonatas EXTENDED models
## APPLIED to sonatas EXTENDED datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/sonatas_multi2_ext_splits.pth


#######################################################################################################3
#######################################################################################################3
## COMBINED MODELS.

## COMBINED not extended models
## APPLIED to COMBINED not extended datasets

./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2_splits.pth

## COMBINED not extended models
## APPLIED to COMBINED EXTENDED datasets

./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2_splits.pth

# ###########################################################################################################

## COMBINED EXTENDED models
## APPLIED to COMBINED not extended datasets

./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_splits.csv ./models/all_multi2_ext_splits.pth

## COMBINED EXTENDED models
## APPLIED to COMBINED EXTENDED datasets

./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi_ext_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext_splits.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi_ext.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi_ext.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/test_all_multi2_ext.csv ./models/all_multi2_ext_splits.pth

./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2_ext.pth
./runtest.sh ../datasets/prep/val_all_multi2_ext.csv ./models/all_multi2_ext_splits.pth

#######################################################################################################


#######################################################################################################
#######################################################################################################
# Crossed tests: 
# 
# Quartets not extended models vs sonatas datasets
# Note that these models have not an extended vocab label encoder, so the extended vocab datasets will have words
# that for sure are not predicted properly. We should test quartets model trained with extended vocab to improve this.

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_splits.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_splits.csv ./models/quartets_multi2_splits.pth

## Extended datasets

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext_splits.csv ./models/quartets_multi2_splits.pth

## THIS ONE WAS NOT RUN ORIGINALLY!
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi2_ext.csv ./models/quartets_multi2_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi2.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi2_ext.csv ./models/quartets_multi2_splits.pth
