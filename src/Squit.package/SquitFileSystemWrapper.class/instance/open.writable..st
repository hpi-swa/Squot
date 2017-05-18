intercepted
open: aResolvable writable: aBoolean
	aBoolean ifTrue: [changedPaths add: (wrappedFilesystem resolve: aResolvable)].
	^ wrappedFilesystem open: aResolvable writable: aBoolean