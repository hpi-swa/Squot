private
copy: sourceOrderCollection withOrder: baseOrderCollection
	"Answer an order with the elements of sourceOrderCollection, but the ordering of baseOrderCollection."
	| newOrder unique |
	unique := sourceOrderCollection copyWithoutAll: baseOrderCollection.
	newOrder := baseOrderCollection intersection: sourceOrderCollection.
	unique do: [ :eachUnique | self insert: eachUnique into: newOrder afterPredecessorsIn: sourceOrderCollection ].
	^ newOrder