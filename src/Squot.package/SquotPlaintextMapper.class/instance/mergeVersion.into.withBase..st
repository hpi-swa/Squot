merging
mergeVersion: right into: left withBase: base
	^ SquotMergeUtilities
		stringOrNilMergeLeft: left
		right: right
		base: base
		ifUnchanged: [SquotEmptyChangeSet withMapper: self]
		ifMerged: [:merged | SquotPlaintextChangeSet withMapper: self from: left to: (self transformVersion: merged)]
		ifConflict: [:conflict | SquotPlaintextChangeSet withMapper: self conflict: conflict]