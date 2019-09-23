as yet unclassified
apply: aGraphDiff toGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	sourceGraph := aGraphDiff right.
	aGraphDiff squotApplyTo: anObjectGraph with: self.
	^ anObjectGraph