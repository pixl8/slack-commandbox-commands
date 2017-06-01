#!/bin/bash
if [[ $TRAVIS_TAG == v* ]] ; then
	VERSION=${TRAVIS_TAG//v}
    cd `dirname $0`;
	CWD="`pwd`";

    sed -i "s/{version}/${VERSION}/" ./box.json

	box forgebox login username="$FORGEBOXUSER" password="$FORGEBOXPASS";
	box publish directory="$CWD";
else
	echo "Not publishing. This is not a tagged release.";
fi