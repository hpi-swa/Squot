visiting
visitCommit: aCommit
	(seen includes: aCommit hash) ifTrue: [^self].
	seen add: aCommit hash.
	revList add: aCommit.
	(sinkCommits includes: aCommit) ifTrue: [^self].
	self visitCollection: aCommit parents