combining diffs
withApplied: anotherDiff
	^ self class
		left: self left
		right: anotherDiff right