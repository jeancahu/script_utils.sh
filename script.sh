#!/bin/bash

## Define ANSI colors
declare -r ANSI_BLUE='\033[1;34m'
declare -r ANSI_DARK_GREEN='\033[0;32m'
declare -r ANSI_GREEN='\033[1;32m'
declare -r ANSI_RED='\033[1;31m'
declare -r ANSI_DARK_PURPLE='\033[0;35m'
declare -r ANSI_PURPLE='\033[1;35m'
declare -r ANSI_YELLOW='\033[1;33m'
declare -r ANSI_NOCOLOR='\033[0m'

## Define util functions
function echo_info ()
{
    echo -e "$ANSI_BLUE""INFO: $1""$ANSI_NOCOLOR" >&2
}

function echo_error ()
{
    echo -e "$ANSI_RED""ERROR: $1""$ANSI_NOCOLOR" >&2
}

function echo_warning ()
{
    echo -e "$ANSI_YELLOW""WARNING: $1""$ANSI_NOCOLOR" >&2
}

function echo_help ()
{
    echo 'Usage: '"$( basename $0 )"' [OPTIONS] [ARG] ... [OPTIONS] [ARG]
*
*
...
'
}

## Parse one-character flags
FLAGS=$( grep -o '^-[a-zA-Z0-9]*' <<< "$*" )$( grep -o ' -[a-zA-Z0-9]*' <<< "$*" )

## Body

if (( $( grep -c 'h' <<< "$FLAGS" ) )); then echo_help && exit 0 ; fi

### EXAMPLE ###

echo_info "Information 1.2.3"

echo_warning "Warning 1-2-3"

echo_error "Error 1_2_3"

echo "Use -h flag for usage information"

exit 0
