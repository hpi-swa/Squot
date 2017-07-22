(PackageInfo named: 'Squot') postscript: '"below, add code to be run after the loading of this package"
"07/16/2017 upgrade from Dictionary storeInfo to SquotTrackedObjectMetadata"
SquotArtifact allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
SquotLiveObject allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
SquotImageStore allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].'!
