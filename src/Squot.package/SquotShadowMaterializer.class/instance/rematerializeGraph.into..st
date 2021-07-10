public converting
rematerializeGraph: aShadowGraph into: targetMutableObjectGraph
	| additionDiff NotFound |
	targetGraph := targetMutableObjectGraph.
	NotFound := #().
	aShadowGraph shadows do:
		[:each | | name existing |
		name := aShadowGraph nameOf: each.
		existing := objectRegistry objectNamed: name ifAbsent: [NotFound].
		existing ~~ NotFound
			ifTrue: [targetMutableObjectGraph assign: name to: existing]].
	additionDiff := targetMutableObjectGraph squotDiffAgainst: aShadowGraph.
	(convertedObjects := SquotNewObjectPatcher new)
		registry: targetMutableObjectGraph;
		apply: additionDiff toLoadedGraph: targetMutableObjectGraph.
	^ targetMutableObjectGraph startObject