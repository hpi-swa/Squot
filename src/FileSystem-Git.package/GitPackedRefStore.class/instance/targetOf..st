accessing
targetOf: aString
	self deprecated: 'Use ref: instead'.
	^ self packedRefs at: aString ifPresent: [:hash | hash]