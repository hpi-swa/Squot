testing
wasDeleted: aResolvable
	| path |
	path := aResolvable asPathWith: watchedStore.
	^ deletedFiles includes: path
	