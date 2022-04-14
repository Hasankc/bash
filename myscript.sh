#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Enter country name"
    exit 1
fi    

function country_detail(){
    local name=$1
    detail=$(curl https://restcountries.com/v3.1/name/${name})
    echo "Capital:"
    echo "$detail" | jq -r '.[].capital[0]'
}

while [[ $# -gt 0 ]]; do
    country=$1
    echo "Name: $country"
    echo "Capital name: $(country_detail $country)"
    shift
done
