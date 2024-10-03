merging
stringMergeLeft: leftString right: rightString base: baseString ifConflict: conflictBlock
	^ self
		stringMergeLeft: leftString
		right: rightString
		base: baseString
		ifUnchanged: [leftString]
		ifMerged: [:merged | merged]
		ifConflict: conflictBlock