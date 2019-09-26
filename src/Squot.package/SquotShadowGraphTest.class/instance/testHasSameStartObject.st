tests
testHasSameStartObject
	| a b |
	a := SquotMutableObjectGraph new
		answer: #z whenAskedForTheNameOf: (a := SquotObjectShadow new);
		startShadow: a;
		asShadowGraph.
	b := SquotMutableObjectGraph new
		answer: #z whenAskedForTheNameOf: (b := SquotObjectShadow new);
		startShadow: b;
		asShadowGraph.
	self assert: (a hasSameStartObjectAs: b).