#!/bin/bash

NUM1=5
NUM2=6
SUM=$((SUM1+SUM2))
DATE=$(date +%Y-%m-%d-%H-%M-%S)
MOVIES=[ bahubali maghadeera darling ]

echo "script started executing at::$DATE"
echo "Sum of num1 and num2::$SUM"

echo "first movie:: $[0]"
echo "second movie:: $[1]"
echo "third movie:: $[2]"
echo "All movies:: $@"