merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| merger |
	merger := SquotThreewayMerger
		base: (self loadSnapshotFrom: leftFSCommit filesystem)
		target: (self loadSnapshotFrom: rightFSCommit filesystem)
		ancestor: (self loadSnapshotFrom: baseFSCommit filesystem).
	^ SquotMergeResult
		changes: {MCPatch operations: merger operations}
		conflicts: merger conflicts