serializing
stonAllInstVarNames
	"1. Do not serialize the delegate registry, which does not really belong to the graph itself but is used as a fallback to look up objects and their names.
	2. Write the startShadow variable first, so that the rendered STON reflects the object graph as it was captured, not starting from the objectNames dictionary."
	| variables |
	variables := super stonAllInstVarNames asOrderedCollection.
	variables
		remove: 'delegateRegistry';
		addFirst: (variables remove: 'startShadow').
	^ variables