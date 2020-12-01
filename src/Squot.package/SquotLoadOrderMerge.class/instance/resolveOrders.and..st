private
resolveOrders: aCollection and: anIncomingCollection
	"Resolve dependency changes and store result to be able to answer hasChanges later."
	"Assumption: aCollection is based on working, anIncomingCollection is based on incoming and additions and removals have have already been applied to both."
	| baseSubset dependencyGraph newOrder |
	(aCollection hasEqualElements: anIncomingCollection) "Trivial case"
		ifTrue: [^ {anIncomingCollection. #noConflicts}].
	baseSubset := base intersection: aCollection.
	dependencyGraph :=
		(SquotGraph nodes: aCollection)
			initializeEdgesFromTotalOrdering: aCollection;
			increaseEdgesFromTotalOrdering: anIncomingCollection;
			decreaseEdgesFromTotalOrdering: baseSubset.
	newOrder := dependencyGraph topologicalOrderIfNone:
		[:cyclePath | ^ {cyclePath. #conflicts}].
	^ {newOrder. #noConflicts}