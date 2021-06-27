converting
asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror
	| reference |
	{[self key isInteger ifTrue: [SquotIndexableField index: self key]].
	[self key isString ifTrue: [SquotInstanceVariable named: self key]].
	[self key isNil ifTrue: [SquotCollectionElement target: self replacementShadow]].
	[self key]}
		detect: [:each | (each value ifNotNil: [:value | reference := value]) notNil].
	^ SquotReferenceTargetExchange
		reference: reference
		leftOwner: leftAndRightShadows first
		target: self value key
		rightOwner: leftAndRightShadows second
		target: self replacementShadow