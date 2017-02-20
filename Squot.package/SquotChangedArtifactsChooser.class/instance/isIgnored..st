testing
isIgnored: anArtifact
	ignored at: anArtifact path
		ifPresent: [:ignoredArtifact | ignoredArtifact
				ifNil: [^ true]
				ifNotNil: [ignoredArtifact = anArtifact ifTrue: [^ true]]].
	^ false