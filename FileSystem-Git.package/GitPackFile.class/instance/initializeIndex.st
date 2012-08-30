initialize-release
initializeIndex 
	| noExtension |
	noExtension := self reference basename copyUpToLast: $..
	reference := (self reference parent / noExtension), 'idx'.
	reference exists ifFalse: [ ^ self ].
	indexFile := GitIndexFile on: reference