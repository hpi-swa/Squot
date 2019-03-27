accessing
updateArtifactTo: anArtifact
	"Have an object with the same path patched to become the given one."
	^ self addDiff:
		(leftArtifacts at: anArtifact path
			ifPresent: [:leftArtifact | leftArtifact diffAgainst: anArtifact]
			ifAbsent: [SquotArtifactAddition of: anArtifact])