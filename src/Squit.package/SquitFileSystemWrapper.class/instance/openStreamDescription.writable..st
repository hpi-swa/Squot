intercepted
openStreamDescription: aResolvable writable: aBoolean
	aBoolean ifTrue: [changedPaths add: (wrappedFilesystem resolve: aResolvable)].
	^ wrappedFilesystem openStreamDescription: aResolvable writable: aBoolean