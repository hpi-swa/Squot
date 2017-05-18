intercepted
writeStreamOn: aResolvable
	changedPaths add: (wrappedFilesystem resolve: aResolvable).
	^ wrappedFilesystem writeStreamOn: aResolvable