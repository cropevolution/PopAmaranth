## Here lies code destined to data treatment and analysis

`combine.awk`
Combine overlapping windows
Usage:
set c for chromosome column and the 0th and 1st array to the start and end positions rspectively

awk -f combine.awk <file_name>



`pca_preparation.Rmd`
Preparation, calculation and plotting of covariants and respective PCA.

`neutrality_tests.sh`
Steps for calculation of the nucleotide diversity, Wu and Watterson estimator, and Tajima's D.



`Stats_track_preparation.Rmd`

Preparation, filtering, and plotting  of the files obtained in `neutrality_tests.sh` for nucleotide diversity, Wu and Watterson estimator, and Tajima's D.
