#!/bin/bash

ls -ltr

echo "All variables passed::$@"
echo "Number of variables passed::$#"
echo "Present script name::$0"
echo "Present working directory::$PWD"
echo "Home directory og present user::$HOME"
echo "Which user is running this script::$USER"
echo "process id of present script::$$"
echo "Previous command process id::$!"