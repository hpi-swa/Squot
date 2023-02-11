testing
hasLoaded: anArtifact
	^ self includesArtifact: anArtifact
	"But different classes may be more specific about what loaded actually means..."