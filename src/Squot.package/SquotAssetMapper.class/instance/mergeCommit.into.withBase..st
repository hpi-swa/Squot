merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| left right base merged |
	left := self loadVersionFrom: leftFSCommit filesystem.
	right := self loadVersionFrom: rightFSCommit filesystem.
	base := self loadVersionFrom: baseFSCommit filesystem.
	merged := SquotMergeUtilities
		atomicMergeLeft: left right: right base: base
		ifConflict: [^ SquotConflictingAssetChangeSet
						withMapper: self left: left right: right base: base].
	^ left = merged
		ifTrue: [SquotEmptyChangeSet withMapper: self]
		ifFalse: [SquotAssetChangeSet withMapper: self from: left to: merged]