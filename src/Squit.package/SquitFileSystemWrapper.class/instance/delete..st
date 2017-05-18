intercepted
delete: aResolvable
	wrappedFilesystem delete: aResolvable.
	changedPaths add: (wrappedFilesystem resolve: aResolvable).