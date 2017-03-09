accessing metadata
artifactClass
	^ self metadata at: #artifactClassName
		ifPresent: [:className | self class environment valueOf: className]
		ifAbsent: [SquotArtifact]