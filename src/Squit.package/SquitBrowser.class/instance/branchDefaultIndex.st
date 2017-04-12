ui
branchDefaultIndex
	^ self branchList size > 1
		ifTrue: [2]
		ifFalse: [1]