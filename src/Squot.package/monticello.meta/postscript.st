(PackageInfo named: 'Squot') postscript: '"below, add code to be run after the loading of this package"
"09/19/2017 renamed SquotLiveObject to SquotLiveArtifact"
(Smalltalk at: #OldSquotLiveObject ifPresent: [:OldSquotLiveObject |
	OldSquotLiveObject allInstancesDo: [:each | SquotLiveArtifact adoptInstance: each]]).
"07/16/2017 upgrade from Dictionary storeInfo to SquotTrackedObjectMetadata"

SquotArtifact allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].

SquotLiveArtifact allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
SquotImageStore allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
"08/18/2018 upgrade object containers to remember the preferred loading order of artifacts"'!
