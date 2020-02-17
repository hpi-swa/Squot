accessing
followSymbolicRefs: aString do: aBlock
	| ref previousRefs |
	previousRefs := OrderedCollection new: 1.
	ref := aString.
	[aBlock value: ref.
	previousRefs add: ref.
	(refStores anySatisfy: [:each | (ref := each targetOf: ref) notNil])
			and: [ref beginsWith: 'ref:']]
		whileTrue:
			[ref := (ref allButFirst: 4) withBlanksTrimmed.
			(previousRefs includes: ref) ifTrue: [self error: 'Recursive symbolic refs']].
	^ previousRefs last "Do not resolve the ref yet. It might not even exist (target isNil)."