as yet unclassified
apply: aGraphDiff toGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	aGraphDiff squotApplyTo: anObjectGraph with: self.
	anObjectGraph startShadow: (patchedObjects at: anObjectGraph startShadow undecorated).
	^ anObjectGraph