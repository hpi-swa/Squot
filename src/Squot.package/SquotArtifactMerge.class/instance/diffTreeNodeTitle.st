*Squot-Tools
diffTreeNodeTitle
	^ (self path isEmpty
		ifTrue: [working printString]
		ifFalse: [self path])