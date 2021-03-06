#!/bin/bash
## The root of everything, just like an index file in a php project
function b() {
    if ! fn_exists "b_$1"; 
        then
            echo "billy does not except $1 as a parameter!"
        else 
            "b_$1" "${@:2}"
    fi
}

function billy() {
    b "${@:0}"
}

## check if a function exists
fn_exists() {
    # appended double quote is an ugly trick to make sure we do get a string -- if $1 is not a known command, type does not output anything
    [ `type -t $1`"" == 'function' ]
}

## PS1
export PS1="\u@\$(pwd)\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

## Pull in all the required files that contain our code
source ~/terminal-ext/server.sh
source ~/terminal-ext/grunt.sh
source ~/terminal-ext/cordova.sh
source ~/terminal-ext/functions.sh
source ~/terminal-ext/git.sh
source ~/terminal-ext/docker.sh