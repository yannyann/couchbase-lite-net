#!/bin/bash

version=1.4.1-b937-v3

for fn in `ls *.nuspec`; do
    cat $fn | sed -e 's/\$version\$/_version_/g' | sed -e "s/_version_/$version/g" > "new_$fn"
done

for fn in `ls new_*.nuspec`; do
    ../../src/.nuget/NuGet.exe pack -BasePath ../.. $fn
done

for fn in `ls new_*.nuspec`; do
    rm $fn
done


