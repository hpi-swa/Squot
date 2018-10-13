testing
testSet
	| set graphBefore graphAfter diff newSet removedItem newLoadedGraph |
	"given"
	set := Set newFrom: {1. 'foo'. StringHolder new contents: 'old'}.
	graphBefore := capturer captureGraph: set.
	set add: 'bar';
		remove: 'foo'.
	(set detect: [:each | each class == StringHolder]) contents: 'new'.
	graphAfter := capturer captureGraph: set.
	diff := graphBefore squotDiffAgainst: graphAfter.
	"when"
	newLoadedGraph := self rematerializeAsNewGraph: graphBefore.
	newSet := newLoadedGraph startObject.
	removedItem := newSet detect: [:each | each = 'foo'].
	diff squotApplyToLoaded: newLoadedGraph.
	"then"
	self assert: (newSet includes: 1).
	self assert: (newSet includes: 'bar').
	self deny: (newSet includes: removedItem).
	self assert: 'new' equals: (newSet detect: [:each | each class == StringHolder]) contents.