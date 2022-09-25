printing
printOn: aStream
	| graphString storeInfoString |
	super printOn: aStream.
	graphString := graphMerge hasChanges ifTrue: [(((graphMerge asString copyAfter: $() allButLast splitBy: ', ') reject: [:each | each beginsWith: '0']) joinSeparatedBy: ', '] ifFalse: ['no changes'].
	storeInfoString := (((metadataMerge asString copyAfter: $() allButLast splitBy: ', ') reject: [:each | each beginsWith: '0']) joinSeparatedBy: ', '.
	aStream space; nextPut: $(.
	graphString ifEmpty: [aStream nextPutAll: 'no object changes']
		ifNotEmpty: [aStream nextPutAll: 'objects: '; nextPutAll: graphString].
	aStream nextPutAll: ', '.
	storeInfoString ifEmpty: [aStream nextPutAll: 'no metadata changes']
		ifNotEmpty: [aStream nextPutAll: 'metadata: '; nextPutAll: storeInfoString].
	aStream nextPut: $).