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

memory_test() {
    valgrind --leak-check=full  ../push_swap $1 2>&1 | tail -1
}

function run_test() {
    input=$1
    output=$(../push_swap "$input" 2>&1)

    memory_test $1
    # echo $output
    if [[ $output == "Error"* ]]; then
        pok
    else
        png
    fi
}



echo -n "Case1:             "; run_test "a"

echo -n "CASE2:             "; run_test "1a"

echo -n "CASE3:             "; run_test "1 a" 

echo -n "CASE4 OVERFLOW:    "; run_test "-2147483649" 

echo -n "CASE5 OVERFLOW:    "; run_test "2147483648" 

echo -n "CASE6 OVERFLOW:    "; run_test "-111111111111111111111111111111111111111111" 

echo -n "CASE7 OVERFLOW:    "; run_test "1111111111111111111111111111111111111111111" 

# echo -n "CASE4 INTMIN:      "; ../push_swap "-2147483649"  >/dev/null 2>&1 && pok || png

echo -n "CASE4 INTMIN:      "; ../push_swap "-2147483648"  >/dev/null 2>&1 && pok || png

echo -n "CASE5 INTMAX:      "; run_test "2147483647"  >/dev/null 2>&1 && pok || png