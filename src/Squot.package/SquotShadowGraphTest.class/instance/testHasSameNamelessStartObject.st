tests
testHasSameNamelessStartObject
	| a b |
	a := SquotMutableObjectGraph new
		startShadow: (SquotPrimitiveValue for: 1);
		asShadowGraph.
	b := SquotMutableObjectGraph new
		startShadow: (SquotPrimitiveValue for: 1);
		asShadowGraph.
	self assert: (a hasSameStartObjectAs: b).