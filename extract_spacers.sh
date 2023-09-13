#!/bin/bash
query_file="$1"
subject_file="$2"
output_file="$3"

#Run BLAST
blastn -query "$query_file" -subject "$subject_file" -outfmt 6 > tmp.txt

#Check for perfect matches and save to output file
awk '{$3 == 100.00 && $4 == $8-$7+1; print}' tmp.txt > "$output_file"

#Count number of perfect matches
perfect_matches_no="$(wc -l < "$output_file")"

#Print number of perfect matches and message to stdout
echo "Number of perfect matches = $perfect_matches_no"
echo "BLAST perfect matches saved to $output_file"
