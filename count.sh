#!/bin/bash

count() {
    results=()

    for i in $(seq 1 "$2"); do
        result=$(../push_swap $(seq 1 "$1" | shuf) | wc -l)
        results+=($result)
    done

    
    # echo "Results: ${results[@]}"  


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
}

# テスト1: 5, 実行回数100回
echo "TEST 5"
echo "--------"
count 5 100
echo ""

# テスト2: 100, 実行回数100回
echo "TEST 100"
echo "--------"
count 100 100
echo ""

# テスト3: 500, 実行回数30回
echo "TEST 500"
echo "--------"
count 500 30
echo ""
