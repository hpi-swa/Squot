public converting
rematerializeGraph: aShadowGraph
	| existingRoot existingShadow targetGraph |
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
	existingShadow := aShadowGraph startShadow sameIn: targetGraph asIn: aShadowGraph ifAbsent: [].
	"If the object looked up by name is not really the same as the object captured in aShadowGraph, start from an empty graph instead. All packages get the SquotShadowGraph anonymousObjectName, and the registry might have several packages, so it is not guaranteed that the correct one is obtained from objectNamed:ifAbsent:."
	existingShadow ifNil: [targetGraph := SquotMutableObjectGraph empty
							delegateRegistry: objectRegistry;
							yourself].
	self assert: (targetGraph isKindOf: SquotMutableObjectGraph).
	^ self rematerializeGraph: aShadowGraph into: targetGraph