private
computeDiffsFromLeftToRight
	leftArtifacts keysAndValuesDo: [:path :leftArtifact | | diff |
		rightArtifacts at: path
			ifPresent: [:myArtifact |
				diff := leftArtifact diffAgainst: myArtifact.
				diff hasChanges
					ifTrue: [diffs at: path put: diff]]
			ifAbsent: [diffs at: path put: (SquotArtifactRemoval of: leftArtifact)].
		ProgressNotification signal]