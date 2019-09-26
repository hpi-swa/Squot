as yet unclassified
apply: aGraphDiff toLoadedGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	materializer := SquotShadowMaterializer new
		registry: patchedObjectGraph;
		sourceGraph: aGraphDiff right;
		targetGraph: patchedObjectGraph;
		yourself.
	aGraphDiff squotApplyToLoaded: patchedObjectGraph with: self.
	^ patchedObjectGraph