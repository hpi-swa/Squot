testing
testSet
	| set graphBefore graphAfter diff newSet removedItem materializer newLoadedGraph |
	"given"
	set := Set newFrom: {1. 'foo'. StringHolder new contents: 'old'}.
	graphBefore := capturer captureGraph: set.
	set add: 'bar';
		remove: 'foo'.
	(set detect: [:each | each class == StringHolder]) contents: 'new'.
	graphAfter := capturer captureGraph: set.
	diff := graphBefore squotDiffAgainst: graphAfter.
	"when"
	materializer := SquotShadowMaterializer new.
	materializer sourceGraph: graphBefore.
	materializer targetGraph: graphBefore asShadowGraph mutableCopy.
	newSet := materializer rematerialize: graphBefore startShadow.
	removedItem := newSet detect: [:each | each = 'foo'].
	newLoadedGraph := materializer objectGraph.
	diff squotApplyToLoaded: newLoadedGraph.
	"then"
	self assert: (newSet includes: 1).
	self assert: (newSet includes: 'bar').
	self deny: (newSet includes: removedItem).
	self assert: 'new' equals: (newSet detect: [:each | each class == StringHolder]) contents.