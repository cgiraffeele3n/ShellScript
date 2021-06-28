#!/bin/bash

function usage(){
    cat <<EOF
$(basename "${0}") is a tool for ...

Usage:
    $(basename "${0}") [args1] [args2] ...

Bogosort algorithm
EOF
    exit 1
}

if [ "$#" -le 1 ]; then
    usage
fi

ARRAY=("$@")
is_sorted=true

while "${is_sorted}" ; do
    for (( i = ${#ARRAY[@]}-1; i > 0; i-- )); do
        count=i
        ((count++))
        r=$((RANDOM % count))
        temp=${ARRAY[$i]}
        ARRAY[$i]=${ARRAY[$r]}
        ARRAY[$r]=$temp
    done
    
    for (( i = 0; i < ${#ARRAY[@]}-1; i++ )); do
        if [ "${ARRAY[$i]}" -ge "${ARRAY[$i+1]}" ]; then
            break
        else
            if [ "$i" -eq "$((${#ARRAY[@]}-2))" ]; then
                is_sorted=false
            fi
        fi
    done
done

for item in "${ARRAY[@]}"; do
    echo "$item"
done
