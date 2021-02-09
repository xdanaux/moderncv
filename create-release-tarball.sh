#!/bin/sh
# script to create a tarball for the files that should be in the CTAN upload

# fetch version via git
VERSION=$(git describe --tags --dirty)
TARBALL=moderncv-$VERSION.tar

# remove existing tarballs
rm -f $TARBALL $TARBALL.gz

# create tar with all files in git repo
git archive HEAD > $TARBALL

# remove git specific files
tar -f $TARBALL --delete .github/ .gitignore create-release-tarball.sh

# compress
gzip $TARBALL
