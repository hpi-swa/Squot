accessing-references
followSymbolicRefs: aString do: aBlock
	| ref previousRefs |
	previousRefs := OrderedCollection new: 1.
	ref := aString.
	[aBlock value: ref.
	previousRefs add: ref.
	ref := [(self baseDir resolve: ref) readStreamDo: [ :stream | stream contents ]]
		on: FileDoesNotExist do: [:ex |
			ex return: (self packedRefs at: ref ifPresent: [:target | target])].
	ref notNil and: [ref beginsWith: 'ref:']]
		whileTrue:
			[ref := (ref allButFirst: 4) withBlanksTrimmed.
			(previousRefs includes: ref) ifTrue: [self error: 'Recursive symbolic refs']].
	^ previousRefs last "Do not resolve the ref yet. It might not even exist (target isNil)."