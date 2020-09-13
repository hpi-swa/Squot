private
computeDiffsFromLeftToRight
	leftArtifacts keysAndValuesDo: [:path :leftArtifact | | diff |
		progress ifNotNil: [progress stepWithText: path].
		rightArtifacts at: path
			ifPresent: [:myArtifact |
				diff := leftArtifact diffAgainst: myArtifact.
				self addDiff: diff]
			ifAbsent: [diffs at: path put: (SquotArtifactRemoval of: leftArtifact)]]