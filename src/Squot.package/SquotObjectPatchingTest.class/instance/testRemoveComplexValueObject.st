testing
testRemoveComplexValueObject
	| set graphBefore graphAfter diff newSet removedItem newLoadedGraph |
	"given"
	set := Set newFrom: {1. {2. {3}. 4}}.
	graphBefore := capturer captureGraph: set.
	set remove: (removedItem := {2. {3}. 4}).
	self assert: {1} equals: set asArray.
	graphAfter := capturer captureGraph: set.
	diff := graphBefore squotDiffAgainst: graphAfter.
	"when"
	newLoadedGraph := self rematerializeAsNewGraph: graphBefore.
	newSet := newLoadedGraph startObject.
	diff squotApplyToLoaded: newLoadedGraph.
	"then"
	self assert: (newSet includes: 1).
	self deny: (newSet includes: removedItem).