testing
patchedCopyOf: anObject toReproduce: aBlock
	"Create a new working copy of the graph induced by anObject, then evaluate aBlock that
	modifies anObject, compute the changes and apply them to the new working copy as 
	well. Answer the thus patched object graph. Its start object is the patched copy of 
	anObject, which should be equal to anObject at the end."
	| graphBefore graphAfter diff newLoadedGraph |
	graphBefore := capturer captureGraph: anObject.
	aBlock value.
	graphAfter := capturer captureGraph: anObject.
	diff := graphBefore squotDiffAgainst: graphAfter.
	newLoadedGraph := self rematerializeAsNewGraph: graphBefore.
	diff squotApplyToLoaded: newLoadedGraph.
	^ newLoadedGraph