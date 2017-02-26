ansi gettable
upToEnd
	| start data |
	start := position.
	position := handle size.
	data := handle copyFrom: start to: position.
	^ isBinary ifTrue: [data] ifFalse: [self converter decodeString: data asString]