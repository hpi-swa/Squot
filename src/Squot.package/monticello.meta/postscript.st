(PackageInfo named: 'Squot') postscript: '"below, add code to be run after the loading of this package"
"2017-09-19 renamed SquotLiveObject to SquotLiveArtifact"
(Smalltalk at: #OldSquotLiveObject ifPresent: [:OldSquotLiveObject |
	OldSquotLiveObject allInstancesDo: [:each | SquotLiveArtifact adoptInstance: each]]).
"2017-07-16 upgrade from Dictionary storeInfo to SquotTrackedObjectMetadata"

SquotArtifact allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].

SquotLiveArtifact allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
SquotImageStore allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].
"2018-08-18 upgrade object containers to remember the preferred loading order of artifacts"
"2020-09-26: Added variables to SquotWorkingCopy"
SquotWorkingCopy allSubInstancesDo: [:each | each convertToCurrentVersion: nil refStream: nil].


"2019-06-08 Clear caches after changing how SquotPackageShadows are decorated with names in snapshots"
SquotWorkingCopy allInstancesDo: [:each | each flushPreviouslySavedArtifacts].
'!
