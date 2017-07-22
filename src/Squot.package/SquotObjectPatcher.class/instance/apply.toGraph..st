as yet unclassified
apply: aGraphDiff toGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	aGraphDiff squotApplyTo: anObjectGraph with: self.
	^ anObjectGraph