tests
testHasDifferentNamelessStartObject
	| a b |
	a := SquotMutableObjectGraph new
		startShadow: (SquotPrimitiveValue for: 1);
		asShadowGraph.
	b := SquotMutableObjectGraph new
		startShadow: (SquotPrimitiveValue for: 2);
		asShadowGraph.
	self deny: (a hasSameStartObjectAs: b).