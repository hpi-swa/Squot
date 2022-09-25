testing
canStore: anArtifact
	"I only store artifacts for which users decided not to load them."
	^ self class canStore: anArtifact