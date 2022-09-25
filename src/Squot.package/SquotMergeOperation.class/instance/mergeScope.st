accessing
mergeScope
	^ mergeScope ifNil: [mergeScope := SquotMergeOperationProjectScope operation: self]