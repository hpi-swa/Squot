merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| left right base merged |
	left := self loadFormFrom: leftFSCommit filesystem.
	right := self loadFormFrom: rightFSCommit filesystem.
	base := self loadFormFrom: baseFSCommit filesystem.
	merged := SquotMergeUtilities
		atomicMergeLeft: left right: right base: base
		ifConflict: [^ SquotConflictingImageChangeSet
						withMapper: self left: left right: right base: base].
	^ left = merged
		ifTrue: [SquotEmptyChangeSet withMapper: self]
		ifFalse: [SquotImageChangeSet withMapper: self from: left to: merged]