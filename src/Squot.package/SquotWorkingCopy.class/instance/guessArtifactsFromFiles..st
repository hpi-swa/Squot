private creating new versions
guessArtifactsFromFiles: aVersion
	self repository extension: #filesystem
		ifPresent: [:fs | ^ self guessArtifactsFromFilesIn: (fs forVersion: aVersion)]
		ifAbsent: []