history walking
visitCommit: aCommit
	(seen includes: aCommit hash) ifTrue: [^self].
	seen add: aCommit hash.
	(sinkCommits includes: aCommit) ifTrue: [^self].
	commitBlock
		ifNotNil: [commitBlock value: aCommit]
		ifNil: [revList add: aCommit].
	searchFrontier addAll: aCommit parents.