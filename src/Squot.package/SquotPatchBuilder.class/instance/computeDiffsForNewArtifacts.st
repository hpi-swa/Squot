private
computeDiffsForNewArtifacts
	(rightArtifacts keys reject: [:each | leftArtifacts includesKey: each])
		do: [:path | | rightArtifact |
			rightArtifact := rightArtifacts at: path.
			diffs at: path put: (SquotArtifactAddition of: rightArtifact).
			ProgressNotification signal: '' extra: path].