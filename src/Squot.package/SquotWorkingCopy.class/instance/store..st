initialize-release
store: anObject

	store := anObject.
	loadOrder ifNil: [loadOrder := store loadOrder asOrderedCollection].