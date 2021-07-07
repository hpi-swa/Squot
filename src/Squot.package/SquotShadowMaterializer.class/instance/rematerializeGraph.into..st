public converting
rematerializeGraph: aShadowGraph into: targetMutableObjectGraph
	| additionDiff currentGraph NotFound |
	targetGraph := targetMutableObjectGraph.
	currentGraph := SquotObjectCapturer new
						registry: targetMutableObjectGraph;
						captureGraph: (targetMutableObjectGraph hasObjects ifTrue: [targetMutableObjectGraph startObject] ifFalse: [SquotObjectGraph empty startObject flag: #todo. "This looks contradictory"]);
						objectGraph.
	additionDiff := currentGraph squotDiffAgainst: aShadowGraph.
	NotFound := #().
	aShadowGraph shadows do:
		[:each | | name existing |
		name := aShadowGraph nameOf: each.
		existing := objectRegistry objectNamed: name ifAbsent: [NotFound].
		existing ~~ NotFound
			ifTrue: [targetMutableObjectGraph assign: name to: existing]].
	(convertedObjects := SquotNewObjectPatcher new)
		registry: targetMutableObjectGraph;
		apply: additionDiff toLoadedGraph: targetMutableObjectGraph.
	^ targetMutableObjectGraph startObject