testing
testAddObjects
	| object graphBefore graphAfter diff newObject materializer newLoadedGraph |
	object := ValueHolder new contents: nil.
	graphBefore := capturer captureGraph: object.
	object contents: (ValueHolder new contents: 1).
	graphAfter := capturer captureGraph: object.
	diff := graphBefore squotDiffAgainst: graphAfter.
	materializer := SquotShadowMaterializer new.
	materializer sourceGraph: graphBefore.
	materializer targetGraph: graphBefore asShadowGraph mutableCopy.
	newObject := materializer rematerialize: graphBefore startShadow.
	newLoadedGraph := materializer objectGraph.
	diff squotApplyToLoaded: newLoadedGraph.
	self assert: newObject contents class == ValueHolder.
	self assert: newObject contents contents == 1.