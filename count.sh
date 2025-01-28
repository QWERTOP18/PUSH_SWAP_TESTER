#!/bin/bash

results=()

for i in {1..50}; do
    result=$(../push_swap $(seq 1 500 | shuf) | wc -l)
    results+=($result)
done

max=$(echo "${results[@]}" | tr ' ' '\n' | sort -n | tail -n 1)
min=$(echo "${results[@]}" | tr ' ' '\n' | sort -n | head -n 1)

sum=0
for result in "${results[@]}"; do
    sum=$((sum + result))
done
avg=$((sum / ${#results[@]}))

echo "MAX: $max"
echo "MIN: $min"
echo "AVE: $avg"
