as yet unclassified
apply: aGraphDiff toLoadedGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	materializer := SquotShadowMaterializer new
		registry: patchedObjectGraph;
		targetGraph: patchedObjectGraph;
		yourself.
	aGraphDiff squotApplyToLoaded: patchedObjectGraph with: self.
	^ patchedObjectGraph