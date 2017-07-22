as yet unclassified
apply: aGraphDiff toLoadedGraph: anObjectGraph
	patchedObjectGraph := anObjectGraph.
	materializer := SquotShadowMaterializer new
		registry: patchedObjectGraph;
		yourself.
	aGraphDiff squotApplyToLoaded: anObjectGraph with: self.
	^ anObjectGraph