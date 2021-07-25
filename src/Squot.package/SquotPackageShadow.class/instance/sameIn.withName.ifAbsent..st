accessing
sameIn: aShadowGraph withName: aName ifAbsent: aBlock
	| otherEdition |
	otherEdition := aShadowGraph shadowNamed: aName ifAbsent: [^ aBlock value].
	otherEdition packageName ~= packageName
		ifTrue: "Graph contained a different package."
			[^ aBlock value].
	self assert: aShadowGraph startShadow undecorated = otherEdition
		description: 'Packages should be the source of a tracked object graph'.
	^ otherEdition