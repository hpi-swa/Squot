registering
named: aString ifAbsent: aBlock
	^ self registry at: aString ifPresent: #shallowCopy ifAbsent: aBlock