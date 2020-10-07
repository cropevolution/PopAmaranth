## here lies data and intermediate files generated during the anlyses.


`<species>_sweeps` contain the top 1% sweeps found for each species

### Generate non-overlapping windows

``` awk -f combine.awk filename 
# can de edited to the disered chromossome, start and end posisitons of the file, as well as printing columns to be added to the final output
```

From the output of `combine.awk`, remove the header (`tail -n+2`), generating ai bedGraph style file (needs to be sorted)
Finnaly, apply
```bedGrapthtoBigWig <nonoverleppingwindowsfile.bedGraph> <chrm.sizes> <output.bw>```

The bigWig file is then ready to be used as a track in the cluster


 



