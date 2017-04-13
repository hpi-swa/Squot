history walking
visitCommit: aCommit
	| continueWithParents |
	(seen includes: aCommit hash) ifTrue: [^self].
	seen add: aCommit hash.
	(sinkCommits includes: aCommit) ifTrue: [^self].
	continueWithParents := true.
	commitBlock
		ifNotNil: [continueWithParents := commitBlock value: aCommit]
		ifNil: [revList add: aCommit].
	continueWithParents ifTrue: [searchFrontier addAll: aCommit parents].