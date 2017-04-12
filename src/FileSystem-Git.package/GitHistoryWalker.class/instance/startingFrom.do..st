history walking
startingFrom: aGitCommit do: aBlock
	self walkWhile:
		[:commit | aBlock value: commit.
			true "do not prune except on sink commits"]
		startingFrom: aGitCommit