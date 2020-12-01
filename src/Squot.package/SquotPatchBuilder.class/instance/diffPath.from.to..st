accessing
diffPath: path from: leftObjectContainer to: rightObjectContainer
	"Add the difference between two objects at the same path."
	| diff |
	diff := leftObjectContainer artifactAt: path
			ifPresent: [:leftArtifact | | rightArtifact |
				rightArtifact := rightObjectContainer artifactAt: path ifAbsent: [].
				rightArtifact
					ifNotNil: [leftArtifact diffAgainst: rightArtifact]
					ifNil: [SquotArtifactRemoval of: leftArtifact]]
			ifAbsent: [SquotArtifactAddition of: (rightObjectContainer artifactAt: path)].
	diff mayAffectArtifact ifTrue: [self addDiff: diff].