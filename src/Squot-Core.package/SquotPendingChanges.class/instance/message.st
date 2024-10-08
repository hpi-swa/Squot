accessing
message
	^ self dialog ifNotNil: #message ifNil: [self initialMessage]