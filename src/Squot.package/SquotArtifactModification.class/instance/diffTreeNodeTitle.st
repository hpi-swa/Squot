converting
diffTreeNodeTitle
	^ (self path isEmpty
		ifTrue: [left printString]
		ifFalse: [self path])