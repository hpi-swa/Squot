accessing
refsPrefixed: aPrefix
	
	|result|
	
	result := Dictionary new.
	self refs keysAndValuesDo: [ :key :ref|
		(key beginsWith: aPrefix) ifTrue: [
			result at: (key copyAfterLast: $/) put: ref]].
	
	^ result