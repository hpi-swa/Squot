private
computeDiffsFromLeftToRight
	leftArtifacts keysAndValuesDo: [:path :leftArtifact | | diff |
		rightArtifacts at: path
			ifPresent: [:myArtifact |
				diff := leftArtifact diffAgainst: myArtifact.
				self addDiff: diff]
			ifAbsent: [diffs at: path put: (SquotArtifactRemoval of: leftArtifact)].
		ProgressNotification signal: '' extra: path]