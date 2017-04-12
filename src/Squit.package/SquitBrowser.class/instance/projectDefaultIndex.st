ui
projectDefaultIndex
	^ self projectList size > 1
		ifTrue: [2]
		ifFalse: [1]