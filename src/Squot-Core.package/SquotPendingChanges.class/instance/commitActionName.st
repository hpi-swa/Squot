accessing
commitActionName
	^ self isMerge ifTrue: ['merging'] ifFalse: ['committing']