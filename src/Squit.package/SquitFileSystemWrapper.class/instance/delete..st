intercepted
delete: aResolvable
	| isFile |
	isFile := wrappedFilesystem isFile: aResolvable.
	wrappedFilesystem delete: aResolvable.
	isFile ifTrue: [changedPaths add: (wrappedFilesystem resolve: aResolvable)].