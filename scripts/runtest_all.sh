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
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/test_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/test_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi/val_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/test_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/test_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/val_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single/val_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/test_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_multi_splits/val_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/test_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/test_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/test_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/test_quartets.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/val_quartets.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/val_quartets.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/val_quartets.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/quartets_v0/quartets_single_splits/val_quartets.csv ./models/quartets_single_splits.pth

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
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_single_splits.pth

## Sonatas not extended models
## APPLIED to sonatas EXTENDED datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_single_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_multi.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_multi_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_single.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_single_splits.pth

# ###########################################################################################################
## Sonatas EXTENDED models
## APPLIED to sonatas not extended datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/sonatas_single_ext_splits.pth

## Sonatas EXTENDED models
## APPLIED to sonatas EXTENDED datasets

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/sonatas_single_ext_splits.pth

./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_multi_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_multi_ext_splits.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_single_ext.pth
./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/sonatas_single_ext_splits.pth


#######################################################################################################3
#######################################################################################################3
## COMBINED MODELS.

## COMBINED not extended models
## APPLIED to COMBINED not extended datasets

./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_single_splits.pth

## COMBINED not extended models
## APPLIED to COMBINED EXTENDED datasets

./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_single_splits.pth

./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_multi.pth
./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_multi_splits.pth
./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_single.pth
./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_single_splits.pth

# ###########################################################################################################

## COMBINED EXTENDED models
## APPLIED to COMBINED not extended datasets

./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_single.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_single.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_single_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_single_splits.csv ./models/combined_single_ext_splits.pth

## COMBINED EXTENDED models
## APPLIED to COMBINED EXTENDED datasets

./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_multi_ext_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_single_ext_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_single_ext_splits.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_multi_ext.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_multi_ext.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/test_combined_single_ext.csv ./models/combined_single_ext_splits.pth

./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_multi_ext.pth
./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_multi_ext_splits.pth
./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_single_ext.pth
./runtest.sh ../datasets/prep/val_combined_single_ext.csv ./models/combined_single_ext_splits.pth

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
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_splits.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_splits.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_splits.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_splits.csv ./models/quartets_single_splits.pth

## Extended datasets

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext_splits.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext_splits.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext_splits.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext_splits.csv ./models/quartets_single_splits.pth

## THIS ONE WAS NOT RUN ORIGINALLY!
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_multi_ext.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_multi_ext.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/test_sonatas_single_ext.csv ./models/quartets_single_splits.pth

# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/quartets_multi.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/quartets_multi_splits.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/quartets_single.pth
# ./runtest.sh ../datasets/prep/sonatas/val_sonatas_single_ext.csv ./models/quartets_single_splits.pth
