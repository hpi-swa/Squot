converting
diffTreeNodeTitle
	^ (self path isEmpty
		ifTrue: [working printString]
		ifFalse: [self path])