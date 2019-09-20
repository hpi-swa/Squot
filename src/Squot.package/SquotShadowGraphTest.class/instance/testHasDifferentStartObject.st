tests
testHasDifferentStartObject
	| a b |
	a := SquotMutableObjectGraph new
		answer: #a whenAskedForTheNameOf: (a := SquotObjectShadow new);
		startShadow: a;
		asShadowGraph.
	b := SquotMutableObjectGraph new
		answer: #b whenAskedForTheNameOf: (b := SquotObjectShadow new);
		startShadow: b;
		asShadowGraph.
	self deny: (a hasSameStartObjectAs: b).