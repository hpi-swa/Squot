as yet unclassified
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| left right base merged |
	left := self loadFormFrom: leftFSCommit filesystem.
	right := self loadFormFrom: rightFSCommit filesystem.
	base := self loadFormFrom: baseFSCommit filesystem.
	merged := SquotMergeUtilities
		atomicMergeLeft: left right: right base: base
		ifConflict: [^ SquotMergeResult
						changes: {}
						conflicts: {SquotMergeConflict left: left right: right base: base}].
	^ SquotMergeResult
		changes: (left = merged ifTrue: [{}] ifFalse: [{left -> merged}])
		conflicts: {}