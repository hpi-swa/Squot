command
want: aSignature
	^ self readFile: 'objects/', (aSignature first: 2), '/', (aSignature allButFirst: 2)