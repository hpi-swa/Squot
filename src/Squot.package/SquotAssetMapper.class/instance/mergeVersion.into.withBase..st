merging
mergeVersion: right into: left withBase: base
	| merged |
	merged := SquotMergeUtilities
		atomicMergeLeft: left right: right base: base
		ifConflict: [^ SquotConflictingAssetChangeSet
						withMapper: self left: left right: right base: base].
	^ (merged squotEqual: left)
		ifTrue: [SquotEmptyChangeSet withMapper: self]
		ifFalse: [SquotAssetChangeSet withMapper: self from: left to: merged]