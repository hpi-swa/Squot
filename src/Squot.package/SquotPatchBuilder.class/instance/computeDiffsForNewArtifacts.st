public
computeDiffsForNewArtifacts
	(rightArtifacts keys reject: [:each | leftArtifacts includesKey: each])
		do: [:path | | rightArtifact diff |
			rightArtifact := rightArtifacts at: path.
			diff := rightArtifact absentCopy diffAgainst: rightArtifact.
			diffs at: path put: diff.
			ProgressNotification signal].