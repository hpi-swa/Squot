accessing metadata
artifactClass
	^ self metadata at: #artifactClassName
		ifPresent: [:className | Environment current valueOf: className]
		ifAbsent: [SquotArtifact]