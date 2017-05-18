intercepted
openFileStream: aResolvable writable: aBoolean
	aBoolean ifTrue: [changedPaths add: (wrappedFilesystem resolve: aResolvable)].
	^ wrappedFilesystem openFileStream: aResolvable writable: aBoolean