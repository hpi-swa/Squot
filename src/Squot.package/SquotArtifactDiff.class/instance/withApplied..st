combining diffs
withApplied: anotherDiff
	self flag: #defect. "This is not really correct, as genuine changes of the receiver are lost."
	^ self class
		left: self left
		right: anotherDiff right