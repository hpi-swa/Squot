materializing
materializeAs: anObject with: aMaterializer
	| size |
	self deprecated.
	size := value basicSize.
	(size == anObject basicSize and: [value class format == anObject class format])
		ifFalse: [^ self squotMaterializeWith: aMaterializer].
	[(anObject respondsTo: #replaceFrom:to:with:startingAt:)
		ifTrue: [anObject replaceFrom: 1 to: size with: value startingAt: 1]
		ifFalse: [1 to: size do: [:i | anObject basicAt: i put: (value basicAt: i)]]]
		on: ModificationForbidden do:
			[:exception | "possibly a source code literal"
			value = anObject
				ifTrue: [exception return: anObject]
				ifFalse: [self flag: #todo. "but what?" exception pass]].
	^ anObject