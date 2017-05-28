testing
wasOpened: aResolvable
	| path |
	path := aResolvable asPathWith: watchedStore.
	^ openedFiles includesKey: path
	