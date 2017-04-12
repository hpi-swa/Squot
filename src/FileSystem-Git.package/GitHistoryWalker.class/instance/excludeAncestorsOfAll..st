history walking
excludeAncestorsOfAll: aCollectionOfCommits
	aCollectionOfCommits do: [:each | self excludeAncestorsOf: each].