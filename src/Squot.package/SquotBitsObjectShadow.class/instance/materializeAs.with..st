materializing
materializeAs: anObject with: aMaterializer
	| size |
	size := value basicSize.
	(size == anObject basicSize and: [value class format == anObject class format])
		ifFalse: [^ self squotMaterializeWith: aMaterializer].
	(anObject respondsTo: #replaceFrom:to:with:startingAt:)
		ifTrue: [anObject replaceFrom: 1 to: size with: value startingAt: 1]
		ifFalse: [1 to: size do: [:i |
				self isThisEverCalled.
				anObject basicAt: i put: (value basicAt: i)]].
	^ anObject