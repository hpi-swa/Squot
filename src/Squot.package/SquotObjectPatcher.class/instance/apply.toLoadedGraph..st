as yet unclassified
apply: aGraphDiff toLoadedGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	aGraphDiff squotApplyToLoaded: anObjectGraph startObject with: self.
	^ anObjectGraph