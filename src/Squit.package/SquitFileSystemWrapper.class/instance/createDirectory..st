intercepted
createDirectory: aResolvable
	| result |
	result := wrappedFilesystem createDirectory: aResolvable.
	changedPaths add: (wrappedFilesystem resolve: aResolvable).
	^ result