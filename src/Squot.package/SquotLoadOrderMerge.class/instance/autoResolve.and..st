private
autoResolve: aCollection and: anIncomingCollection
	"Resolve dependency changes and store result to be able to answer hasChanges later."
	"Assumption: aCollection is based on working, anIncomingCollection is based on incoming and additions and removals have have already been applied to both."
	| baseSubset dependencyGraph newOrder |
	(aCollection hasEqualElements: anIncomingCollection) ifTrue: "Trivial case"
		[^ resolvedPatch := GenericDiff squotDiffClass new
			file1: working;
			file2: anIncomingCollection;
			diff].
	baseSubset := base intersection: aCollection.
	dependencyGraph :=
		(SquotGraph nodes: aCollection)
			initializeEdgesFromTotalOrdering: aCollection;
			increaseEdgesFromTotalOrdering: anIncomingCollection;
			decreaseEdgesFromTotalOrdering: baseSubset.
	"Return topological order of the graph or find a cycle and turn it into a conflict."
	newOrder := dependencyGraph topologicalOrderIfNone:
		[:cyclePath |
		containerConflicts at: cyclePath put: SquotLoadOrderConflict new.
		^ nil].
	^ resolvedPatch := GenericDiff squotDiffClass new
			file1: working;
			file2: newOrder;
			diff