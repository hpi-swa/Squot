public
computeDiffsFromLeftToRight
	leftArtifacts keysAndValuesDo: [:path :leftArtifact | | diff |
		rightArtifacts at: path
			ifPresent: [:myArtifact |
				diff := leftArtifact diffAgainst: myArtifact.
				diff hasChanges
					ifTrue: [diffs at: path put: diff]]
			ifAbsent: [
				diff := leftArtifact diffAgainst: (SquotAbsentArtifact newFrom: leftArtifact).
				diffs at: path put: diff].
		ProgressNotification signal]