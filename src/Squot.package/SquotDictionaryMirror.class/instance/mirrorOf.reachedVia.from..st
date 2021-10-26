reflection
mirrorOf: anObject reachedVia: aReference from: referrerObject
	(aReference isCollectionElement and: [self classUsesIdentityHash])
		ifTrue: [^ SquotLookupKeyMirror classWithIrrelevantKeyHash: anObject class].
	^ super mirrorOf: anObject reachedVia: aReference from: referrerObject