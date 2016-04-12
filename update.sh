#!/bin/bash

cloneDir=${1:-tmp}
shouldProvision=false

# HELPERS FUNCTIONS

function exists {
    if [ -e "$1" ]
        then return 0
        else return 1
    fi
}

function prompt {
    while true ; do
        read -p "$1 [Y/n] " answer

        case $answer in
            Y|y|Yes|yes|yep) return 0 ;;
            N|n|No|no|nope) return 1 ;;
        esac
    done
}

function compare {
    firstFile=$(cat "$1")
    secondFile=$(cat "$2")

    if [ "$firstFile" != "$secondFile" ]
        then return 0
        else return 1
    fi
}

# UPDATE SCRIPT

if exists "./$cloneDir" ; then
    echo "A file named \"$cloneDir\" already exists. Aborting…" ; exit
fi

echo "=> Cloning laravel/homestead repository…"
git clone https://github.com/laravel/homestead.git "./$cloneDir" &> /dev/null

if ! exists "./scripts" ; then
    cp -r "./$cloneDir/scripts" .

    shouldProvision=true
else
    for file in "./$cloneDir/scripts/"* ; do
        name=$(basename $file)

        if ! exists "./scripts/$name" ; then
            echo "=> Copying new script $name"
            cp "$file" ./scripts

            shouldProvision=true
        else
            if compare "./$cloneDir/scripts/$name" "./scripts/$name" ; then
                if prompt "The script $name has been updated. Replace?" ; then
                    echo "=> Updating script $name"
                    cp "$file" ./scripts

                    shouldProvision=true
                fi
            fi
        fi
    done
fi

if ! exists "./after.sh" ; then
    cp "./$cloneDir/src/stubs/after.sh" .
fi

if ! exists "./aliases" ; then
    echo "=> Copying aliases file"
    cp "./$cloneDir/src/stubs/aliases" .

    shouldProvision=true
else
    if compare "./$cloneDir/src/stubs/aliases" "./aliases" ; then
        if prompt "The aliases file has been updated. Replace?" ; then
            echo "=> Updating aliases file"
            cp "./$cloneDir/src/stubs/aliases" .

            shouldProvision=true
        fi
    fi
fi

echo "=> Deleting temporary folder \"$cloneDir\""
rm -rf "$cloneDir"

if [ $shouldProvision == true ] ; then
    echo "Don't forget to do a box provisioning!"
else
    echo "Nothing has been updated!"
fi
