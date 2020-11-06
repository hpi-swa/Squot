accessing
updateArtifactTo: anArtifact
	"Have an object with the same path patched to become the given one."
	| diff |
	diff := leftArtifacts at: anArtifact path
			ifPresent: [:leftArtifact | leftArtifact diffAgainst: anArtifact]
			ifAbsent: [SquotArtifactAddition of: anArtifact].
	diff mayAffectArtifact ifTrue: [self addDiff: diff].