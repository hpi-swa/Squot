public converting
rematerializeGraph: aShadowGraph into: targetMutableObjectGraph
	| additionDiff NotFound |
	targetGraph := targetMutableObjectGraph.
	NotFound := #().
	aShadowGraph shadows do:
		[:each | | existing |
		existing := each sameIn: objectRegistry asIn: aShadowGraph ifAbsent: [NotFound].
		existing ~~ NotFound
			ifTrue: [targetMutableObjectGraph assign: (objectRegistry nameOf: existing) to: existing]].
	additionDiff := targetMutableObjectGraph squotDiffAgainst: aShadowGraph.
	(convertedObjects := SquotPatcher new)
		registry: targetMutableObjectGraph;
		apply: additionDiff toLoadedGraph: targetMutableObjectGraph.
	^ targetMutableObjectGraph startObject