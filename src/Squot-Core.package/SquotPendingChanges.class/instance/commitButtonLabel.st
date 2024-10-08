accessing
commitButtonLabel
	^ self isMerge ifTrue: ['Merge'] ifFalse: ['Commit']