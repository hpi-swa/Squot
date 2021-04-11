public converting
rematerializeGraph: aShadowGraph
	| start mirror |
	start := aShadowGraph startShadow.
	mirror := start undecorated class squotMirror.
	walk := SquotGraphWalk startingFrom: start -> mirror.
	sourceGraph := aShadowGraph.
	targetGraph := SquotMutableObjectGraph new.
	targetGraph startName: aShadowGraph startName.
	pendingReferences := IdentityDictionary new.
	remainingReferences := IdentityDictionary new.
	convertedObjects := IdentityDictionary new.
	[walk atEnd] whileFalse:
		[ | next |
		next := walk next. mirror := next value. next := next key.
		self rematerialize: next reflectedIn: mirror].
	^ targetGraph startObject