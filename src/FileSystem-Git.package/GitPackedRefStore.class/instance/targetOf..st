accessing
targetOf: aString
	^ self packedRefs at: aString ifPresent: [:hash | hash]