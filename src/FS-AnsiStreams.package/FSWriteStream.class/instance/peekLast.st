character writing
peekLast
	position > 0
		ifTrue: [handle at: position]
		ifFalse: [nil]