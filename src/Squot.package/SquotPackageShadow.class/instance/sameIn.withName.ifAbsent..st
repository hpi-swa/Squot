accessing
sameIn: aShadowGraph withName: aName ifAbsent: aBlock
	| otherEdition |
	otherEdition := aShadowGraph shadowNamed: aName ifAbsent: [^ aBlock value].
	self assert: otherEdition packageName = packageName.
	self assert: aShadowGraph startShadow undecorated = otherEdition
		description: 'Packages should be the source of a tracked object graph'.
	^ otherEdition