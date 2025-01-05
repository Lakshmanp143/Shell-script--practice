#!/bin/bash

NUM1=5
NUM2=6
SUM=$((NUM1+NUM2))
DATE=$(date +%Y-%m-%d-%H-%M-%S)
MOVIES=("bahubali" "maghadeera" "darling")

echo "script started executing at::$DATE"

echo "Sum of num1 and num2::$SUM"

echo "first movie:: ${MOVIES[0]}"
echo "second movie:: ${MOVIES[1]}"
echo "third movie:: ${MOVIES[2]}"
echo "All movies:: ${MOVIES[@]}"