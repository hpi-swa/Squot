(PackageInfo named: 'Squot') preamble: '"below, add code to be run before the loading of this package"
"renamed SquotLiveObject to SquotLiveArtifact"
(Environment current valueOf: #SquotLiveObject ifAbsent: []) ifNotNil:
	[:SquotLiveObject | Smalltalk at: #OldSquotLiveObject put: SquotLiveObject].'!
