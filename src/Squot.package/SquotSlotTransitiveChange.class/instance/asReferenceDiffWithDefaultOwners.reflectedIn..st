converting
asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror
	| reference |
	{[self key isInteger ifTrue: [SquotIndexableField index: self key]].
	[self key isString ifTrue: [SquotInstanceVariable named: self key]].
	[self key isNil ifTrue: [SquotCollectionElement target: self replacementShadow]].
	[self key]}
		detect: [:each | (each value ifNotNil: [:value | reference := value]) notNil].
	^ SquotDifferentReferenceTarget
		reference: reference
		leftOwner: leftAndRightShadows first
		target: (aMirror reflect: reference of: leftAndRightShadows first)
		rightOwner: leftAndRightShadows second
		target: (aMirror reflect: reference of: leftAndRightShadows second)