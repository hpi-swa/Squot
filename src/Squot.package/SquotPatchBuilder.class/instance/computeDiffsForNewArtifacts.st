private
computeDiffsForNewArtifacts
	(rightArtifacts keys reject: [:each | leftArtifacts includesKey: each])
		do: [:path | | rightArtifact |
			progress ifNotNil: [progress stepWithText: path].
			rightArtifact := rightArtifacts at: path.
			diffs at: path put: (SquotArtifactAddition of: rightArtifact)].