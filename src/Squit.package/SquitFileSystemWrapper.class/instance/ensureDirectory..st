intercepted
ensureDirectory: aResolvable
	| new path |
	path := wrappedFilesystem resolve: aResolvable.
	new := path withParents reject: [:each | wrappedFilesystem exists: each].
	wrappedFilesystem ensureDirectory: aResolvable.
	changedPaths addAll: new.