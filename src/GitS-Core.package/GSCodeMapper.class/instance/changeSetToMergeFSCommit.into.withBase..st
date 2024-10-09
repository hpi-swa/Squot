changes-creation
changeSetToMergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| merger |
	GSMergeUtilities
		hexHashMerge: [:commit | self hexHashIn: commit]
		left: leftFSCommit
		right: rightFSCommit
		base: baseFSCommit
		ifUnchanged: [^ GSEmptyChangeSet withMapper: self].
	merger := [GSThreewayCodeMerger
		base: (self loadSnapshotFrom: leftFSCommit filesystem)
		target: (self loadSnapshotFrom: rightFSCommit filesystem)
		ancestor: (self loadSnapshotFrom: baseFSCommit filesystem)]
			on: MCNoChangesException
			do: #resume.
	(merger operations isEmpty and: [merger conflicts isEmpty])
		ifTrue: [^ GSEmptyChangeSet withMapper: self].
	^ GSCodeChangeSet
		withMapper: self
		operations: merger operations
		conflicts: merger conflicts