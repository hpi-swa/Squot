as yet unclassified
apply: aGraphDiff toLoadedGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	materializer := SquotShadowMaterializer new
		registry: patchedObjectGraph;
		targetGraph: anObjectGraph;
		yourself.
	aGraphDiff squotApplyToLoaded: anObjectGraph with: self.
	^ anObjectGraph