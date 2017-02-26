character writing
peekLast
	position > 1
		ifTrue: [handle at: position - 1]
		ifFalse: [nil]