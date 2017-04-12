history walking
startingFromAll: aCollectionOfCommits do: aBlock
	self walkWhile:
		[:commit | aBlock value: commit.
			true "do not prune except on sink commits"]
		startingFromAll: aCollectionOfCommits