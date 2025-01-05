#!/bin/bash

NUMBER=$1

# -eq ,-ne, -lt, -gt, -le, ge 
if [ $NUMBER -gt 100 ]
then
    echo "Given number greater than 100"
elif
    echo "Given number less than 100"
else 
    echo "Given number greater than or equal to 100"
fi