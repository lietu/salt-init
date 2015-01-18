#!/usr/bin/env bash

function link {
    local custom="$1"
    local site="$2"

    if [[ ! -d "${custom}" ]]; then
        echo "Couldn't find ${custom}"
        exit 1
    fi

    for file in "${custom}"/*; do
            dst=$(readlink -f "${file}")
            file=$(basename "${file}")
            echo "Linking ${site}/_site/${file} -> ${dst}"
            ln -sf "${dst}" "${site}/_site/${file}"
    done
}

link lietu-net-custom lietu-net
link jsis-name-custom jsis-name
