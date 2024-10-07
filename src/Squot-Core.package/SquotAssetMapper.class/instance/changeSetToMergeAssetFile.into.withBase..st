merging
changeSetToMergeAssetFile: right into: left withBase: base
	^ SquotMergeUtilities
		atomicMergeLeft: left
		right: right
		base: base
		ifUnchanged: [SquotEmptyChangeSet withMapper: self]
		ifMerged: [:merged | SquotAssetChangeSet withMapper: self from: left to: merged]
		ifConflict: [:conflict | SquotConflictingAssetChangeSet withMapper: self conflict: conflict]