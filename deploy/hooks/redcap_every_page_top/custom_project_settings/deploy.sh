#!/bin/bash
set -e

export MYTARGETDIR=$1

# determine the directory where this script resides
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# get source files
TEMPDIR=`mktemp -d`
git clone ssh://git@ctsit-forge.ctsi.ufl.edu/redcap_custom_project_settings.git $TEMPDIR

# If you need to checkout code from another branch, uncomment and adjust this line
# git --git-dir=$TEMPDIR/.git --work-tree=$TEMPDIR checkout develop

# copy files to the correct target locations
mkdir -p $MYTARGETDIR
cp $TEMPDIR/cps_hook.php $MYTARGETDIR

rm -rf $TEMPDIR
