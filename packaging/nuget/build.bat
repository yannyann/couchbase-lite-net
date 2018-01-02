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