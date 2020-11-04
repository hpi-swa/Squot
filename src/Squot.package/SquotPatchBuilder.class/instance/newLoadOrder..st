accessing
newLoadOrder: aCollection
	patchedLoadOrder := aCollection asOrderedCollection.
	"Use a merge to get additions and removals applied correctly."
	loadOrderMerge := self mergeNewLoadOrder: aCollection.