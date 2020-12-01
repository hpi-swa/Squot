private
restoreObjectFrom: anArtifact
	^ self activateObjectRegistryDuring:
		[objects
			at: anArtifact path
			ifPresent: [:object | self restore: object from: anArtifact]
			ifAbsent: [self initializeObjectFrom: anArtifact]]