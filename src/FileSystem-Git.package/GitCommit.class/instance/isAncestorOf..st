public-testing
isAncestorOf: aCommitish
	| possibleDescendant |
	possibleDescendant := aCommitish asCommit.
	^ (self mergeBaseWithAnyOf: {possibleDescendant hexHash}) = self