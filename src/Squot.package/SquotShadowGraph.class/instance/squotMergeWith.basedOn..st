Squot-shadow-diffing
squotMergeWith: incomingGraph basedOn: baseGraph
	| mergeGuide builder |
	mergeGuide := SquotObjectGraphMergeGuide working: self base: baseGraph incoming:  incomingGraph.
	builder := SquotMergeBuilder client: mergeGuide workingRoot: self baseRoot: baseGraph incomingRoot: incomingGraph.
	builder enqueueInstances: (SquotObjectReflection object: self mirror: self class squotMirror) base: (SquotObjectReflection object: baseGraph mirror: baseGraph class squotMirror) incoming: (SquotObjectReflection object: incomingGraph mirror: incomingGraph class squotMirror) reachedVia: nil.
	builder walkUpToEnd.
	^ mergeGuide mergeOfRoot