testing
testAddObjects
	| object graphBefore graphAfter diff newObject newLoadedGraph |
	object := ValueHolder new contents: nil.
	graphBefore := capturer captureGraph: object.
	object contents: (ValueHolder new contents: 1).
	graphAfter := capturer captureGraph: object.
	diff := graphBefore squotDiffAgainst: graphAfter.
	newLoadedGraph := self rematerializeAsNewGraph: graphBefore.
	newObject := newLoadedGraph startObject.
	diff squotApplyToLoaded: newLoadedGraph.
	self assert: newObject contents class == ValueHolder.
	self assert: newObject contents contents == 1.