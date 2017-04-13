accessing - multibyte support
basicNextInto: aCollection
	| count |
	count := handle at: position + 1 read: aCollection startingAt: 1 count: aCollection size.
	position := position + count.
 	^ count < aCollection size
		ifTrue: [aCollection first: count]
		ifFalse: [aCollection]