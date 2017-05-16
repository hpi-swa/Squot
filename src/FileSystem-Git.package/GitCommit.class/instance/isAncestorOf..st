public-testing
isAncestorOf: aCommitish
	| possibleDescendant |
	possibleDescendant := aCommitish asCommit.
	^ (self nearestMergeBaseWithAnyOf: {possibleDescendant hexHash}) = self