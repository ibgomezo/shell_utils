#!/bin/bash

pfile=""

declare -A PMAP

readProperties() {
    if [ -f "$1" ]
    then
        echo "$1 found."
        pfile=$1

        while IFS='=' read -r key value
        do
            key=$(echo $key | tr '.' '_')
            PMAP[${key}]=${value}
        done < "$1"

    else
        echo "$1 not found."
    fi
}

getProperty() {
    local r=${PMAP[$1]}
    echo "$r"
}

setProperty() {
    if ! grep -R "^[#]*\s*${1}=.*" $pfile > /dev/null; then
        echo "APPENDING because '${1}' not found"
        echo "$1=$2" >> $pfile
    else
        echo "SETTING because '${1}' found already"
        sed -ir "s/^[#]*\s*${1}=.*/$1=$2/" $pfile
    fi
    PMAP[$1]=$2
}
