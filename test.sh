#! /bin/bash

DIR=..
if [[ ! -f checker ]];then
curl -O https://cdn.intra.42.fr/document/document/28355/checker_linux
mv checker_linux checker
chmod +x checker
fi


ARG=$(seq 1 2 | shuf); ${DIR}/push_swap $ARG | ./checker $ARG
ARG=$(seq 1 10 | shuf); ${DIR}/push_swap $ARG | ./checker $ARG
ARG=$(seq 1 100 | shuf); ${DIR}/push_swap $ARG | ./checker $ARG
ARG=$(seq 1 500 | shuf); ${DIR}/push_swap $ARG | ./checker $ARG
