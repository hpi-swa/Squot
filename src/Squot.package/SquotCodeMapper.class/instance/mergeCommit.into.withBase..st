merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| merger |
	merger := [SquotThreewayCodeMerger
		base: (self loadSnapshotFrom: leftFSCommit filesystem)
		target: (self loadSnapshotFrom: rightFSCommit filesystem)
		ancestor: (self loadSnapshotFrom: baseFSCommit filesystem)]
			on: MCNoChangesException
			do: #resume.
	(merger operations isEmpty and: [merger conflicts isEmpty])
		ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ SquotCodeChangeSet
		withMapper: self
		operations: merger operations
		conflicts: merger conflicts