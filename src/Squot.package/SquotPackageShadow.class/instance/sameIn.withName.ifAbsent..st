accessing
sameIn: aGraph withName: aName ifAbsent: aBlock
	| otherEdition |
	otherEdition :=  [aGraph class squotMirror reflect: (SquotGraphElementWithName name: aName) of: aGraph] on: KeyNotFound do: [:e | ^ aBlock value].
	otherEdition packageName ~= packageName
		ifTrue: "Graph contained a different package."
			[^ aBlock value].
	(aGraph respondsTo: #startShadow)
		ifTrue: [self assert: aGraph startShadow undecorated = otherEdition
				description: 'Packages should be the source of a tracked object graph'].
	^ otherEdition