visiting
visit: aReference
	aReference isFile
		ifTrue: [self visitFile: aReference]
		ifFalse: [self visitDirectory: aReference].