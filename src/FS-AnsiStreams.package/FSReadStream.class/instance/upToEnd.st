ansi gettable
upToEnd
	| start data |
	start := position + 1.
	position := handle size.
	data := handle copyFrom: start to: position.
	^ isBinary ifTrue: [data] ifFalse: [self converter decodeString: data asString]