#! /bin/bash

echo " ===  welcome reporter  agent ===== "

user_name=$1
target_Dir=$2

read -p "enter reason of the report:" Report_reason

echo "=============================="
echo " admin : ${user_name} "
echo " the  Target_Dir : ${target_Dir}"
echo " Reason report:${Report_reason}"
echo "=============================="



echo "count of argments:$#"
echo " argments:$@"
echo "=============================="

echo "⏳ The folder contents are being checked now..."
ls "$target_Dir"

echo "-----------------------------------"
echo "📉 (Exit Status): $?"
echo "=== Report completed ==="

