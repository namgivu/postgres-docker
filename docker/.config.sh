#!/usr/bin/env bash
cSH=`cd $(dirname $BASH_SOURCE) && pwd`  # get cSH=config_SCRIPT_HOME executed script's path, containing folder, cd & pwd to get container path
cAH=`cd $cSH/.. && pwd`

# create .env from .env00.$ENV
if [[ -z $ENV ]]; then echo 'System variable $ENV not defined'; exit 1; fi
    create_from_f="$cAH/config_vault/.env00.$ENV"; if [[ ! -f $create_from_f ]]; then echo "File .env00 for :$ENV not found in $cAH/config_vault/"; exit 1; fi
          env00_f="$cSH/.env00"  # xxx_f aka xxx_file
            env_f="$cSH/.env"

    cp -f $create_from_f $env00_f

    source $env00_f
    if [[ -z $STACK_ID ]]; then echo "Param :STACK_ID not found in $env00_f"; exit 1; fi
        export STACK_ID="${STACK_ID}"
            template_str=`cat $env00_f`; eval "echo \"$template_str\" " > $env_f  # bash to fill in template ref. https://unix.stackexchange.com/a/560408/17671

# load .env
if [[ ! -f "$cSH/.env" ]]; then echo "File not found .env at $cSH - please clone one from *.env in `$cSH/../config_vault` "; exit 1; fi
source "$cSH/.env"
