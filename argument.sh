#! /bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'
function png() {
	printf "${RED}NG${RESET}\n"
}
function pok() {
	printf "${GREEN}OK${RESET}\n"
}


function run_test() {
    input=$1
    output=$(../push_swap "$input")

    echo $output

    if [[ $output == "Error"* ]]; then
        pok
    else
        png
    fi
}

echo -n "Case1:"; run_test "a"

echo -n "CASE2:"; run_test "-1"

echo -n "CASE3:"; run_test "1 a" 

echo -n "CASE4 OVERFLOW:"; run_test "-2147483649" 

echo -n "CASE5 OVERFLOW:"; run_test "2147483648" 

echo -n "CASE6 OVERFLOW:"; run_test "-111111111111111111111111111111111111111111" 

echo -n "CASE7 OVERFLOW:"; run_test "1111111111111111111111111111111111111111111" 
