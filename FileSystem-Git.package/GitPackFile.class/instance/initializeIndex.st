operations
initializeIndex 
	| noExtension indexReference |
	noExtension := self reference basename copyUpToLast: $..
	indexReference := (self reference parent / noExtension), 'idx'.
	indexReference exists ifFalse: [ ^ self ].
	indexFile := GitIndexFile on: indexReference