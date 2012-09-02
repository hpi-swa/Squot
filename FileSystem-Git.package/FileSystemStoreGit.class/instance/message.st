git-delegating
message
	^ revision isNil
		ifTrue: [ '' ]
		ifFalse: [ revision message ]