merging
changeSetToMergeName: rightString into: leftString withBase: baseString
	^ SquotMergeUtilities
		atomicMergeLeft: leftString
		right: rightString
		base: baseString
		ifUnchanged: [nil]
		ifMerged: [:merged | SquotMetadataNameChangeSet withMapper: self from: leftString to: merged]
		ifConflict: [:conflict | SquotMetadataNameChangeSet withMapper: self conflict: conflict]