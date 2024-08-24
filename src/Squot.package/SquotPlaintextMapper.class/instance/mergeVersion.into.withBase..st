merging
mergeVersion: right into: left withBase: base
	^ SquotMergeUtilities
		stringOrNilMergeLeft: left
		right: right
		base: base
		ifUnchanged: [SquotEmptyChangeSet withMapper: self]
		ifMerged: [:merged | SquotPlaintextNormalChangeSet withMapper: self from: left to: (self transformVersion: merged)]
		ifConflict: [:conflict | SquotPlaintextConflictChangeSet withMapper: self conflict: conflict]