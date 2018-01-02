#!/bin/bash



msbuild /t:clean /p:Configuration=Packaging ../../src/Couchbase.Lite.Net35.sln /p:PublishDir=staging/Couchbase.Lite/net35
msbuild /t:clean /p:Configuration=Packaging ../../src/Couchbase.Lite.Net45.sln /p:PublishDir=staging/Couchbase.Lite/net45
msbuild /t:clean /p:Configuration=Packaging ../../src/Couchbase.Lite.iOS.sln /p:PublishDir=staging/Couchbase.Lite/Xamarin.iOS10
msbuild /t:clean /p:Configuration=Packaging ../../src/Couchbase.Lite.Android.sln /p:PublishDir=staging/Couchbase.Lite/MonoAndroid

msbuild /t:build /p:Configuration=Packaging ../../src/Couchbase.Lite.Net35.sln /p:PublishDir=staging/Couchbase.Lite/net35
msbuild /t:build /p:Configuration=Packaging ../../src/Couchbase.Lite.Net45.sln /p:PublishDir=staging/Couchbase.Lite/net45
msbuild /t:build /p:Configuration=Packaging ../../src/Couchbase.Lite.iOS.sln /p:PublishDir=staging/Couchbase.Lite/Xamarin.iOS10
msbuild /t:build /p:Configuration=Packaging ../../src/Couchbase.Lite.Android.sln /p:PublishDir=staging/Couchbase.Lite/MonoAndroid

msbuild /t:publish /p:Configuration=Packaging ../../src/Couchbase.Lite.Net35.sln /p:PublishDir=staging/Couchbase.Lite/net35
msbuild /t:publish /p:Configuration=Packaging ../../src/Couchbase.Lite.Net45.sln /p:PublishDir=staging/Couchbase.Lite/net45
msbuild /t:publish /p:Configuration=Packaging ../../src/Couchbase.Lite.iOS.sln /p:PublishDir=staging/Couchbase.Lite/Xamarin.iOS10
msbuild /t:publish /p:Configuration=Packaging ../../src/Couchbase.Lite.Android.sln /p:PublishDir=staging/Couchbase.Lite/MonoAndroid

for fn in `ls *.nuspec`; do
    cat $fn | sed -e "s/1.4.1-b937/1.4.1-b937-v2/g"
    cat $fn
done


..\..\src\.nuget\NuGet.exe pack -BasePath ../.. couchbase-lite.nuspec
..\..\src\.nuget\NuGet.exe pack -BasePath ../.. couchbase-lite-storage-systemsqlite.nuspec
..\..\src\.nuget\NuGet.exe pack -BasePath ../.. couchbase-lite-storage-customsqlite.nuspec
..\..\src\.nuget\NuGet.exe pack -BasePath ../.. couchbase-lite-listener.nuspec

dotnet nuget push *.nupkg --api-key d60b4aea-cd1c-3699-a005-fdbd104af5cd