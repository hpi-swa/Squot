adding and removing
remove: anObject
	| paths |
	paths := store pathsOf: anObject.
	store remove: anObject.
	loadOrder removeAll: paths.