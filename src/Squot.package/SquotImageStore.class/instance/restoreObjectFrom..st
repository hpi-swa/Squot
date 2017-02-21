private
restoreObjectFrom: anArtifact
	objects
		at: anArtifact path
		ifPresent: [:object | self restore: object from: anArtifact]
		ifAbsent: [self initializeObjectFrom: anArtifact].