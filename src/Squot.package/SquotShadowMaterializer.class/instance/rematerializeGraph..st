public converting
rematerializeGraph: aShadowGraph
	| existingRoot targetGraph |
	existingRoot := objectRegistry objectNamed: aShadowGraph startName ifAbsent: [].
	targetGraph :=
		existingRoot
			ifNil: [SquotMutableObjectGraph empty
					delegateRegistry: objectRegistry;
					yourself]
			ifNotNil: [SquotObjectCapturer new
						registry: objectRegistry;
						captureGraph: existingRoot;
						objectGraph].
	self assert: (targetGraph isKindOf: SquotMutableObjectGraph).
	^ self rematerializeGraph: aShadowGraph into: targetGraph