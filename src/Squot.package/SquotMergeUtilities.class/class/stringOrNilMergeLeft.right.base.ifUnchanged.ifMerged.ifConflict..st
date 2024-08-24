merging
stringOrNilMergeLeft: leftStringOrNil
right: rightStringOrNil
base: baseStringOrNil
ifUnchanged: unchangedBlock
ifMerged: mergedBlock
ifConflict: conflictBlock
	^ self
		atomicMergeLeft: leftStringOrNil
		right: rightStringOrNil
		base: baseStringOrNil
		ifUnchanged: unchangedBlock
		ifMerged: mergedBlock
		ifConflict: [:conflict |
			({baseStringOrNil. leftStringOrNil. rightStringOrNil} allSatisfy: #isString)
				ifFalse: [^ conflictBlock value: conflict].
			self
				stringMergeLeft: leftStringOrNil
				right: rightStringOrNil
				base: baseStringOrNil
				ifConflict: conflictBlock]