(PackageInfo named: 'Squot') postscript: '"below, add code to be run after the loading of this package"
"07/16/2017 upgrade from Dictionary storeInfo to SquotTrackedObjectMetadata"
SquotArtifact allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
SquotLiveObject allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
SquotImageStore allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
"07/30/2017 migrate from old to new graph objects"
SquotObjectRegistry allInstances copy do: [:each |
	each becomeForward: (SquotObjectRegistry2 new
		instVarNamed: ''graphForStorage'' put: (SquotMutableObjectGraph new copySameFrom: each);
		yourself)].
SquotObjectGraph allInstances copy do: [:each |
	each becomeForward: (SquotMutableObjectGraph new
		copySameFrom: each;
		yourself)].'!
