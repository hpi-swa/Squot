reading
next: n into: aCollection startingAt: startIndex
	"Read n objects into the given collection. 
	Return aCollection or a partial copy if less than n elements have been read."
	
	| count |
	count := self readInto: aCollection startingAt: startIndex count: n.
	count = n
		ifTrue:[ ^aCollection ]
		ifFalse:[ ^aCollection copyFrom: 1 to: startIndex + count - 1 ]