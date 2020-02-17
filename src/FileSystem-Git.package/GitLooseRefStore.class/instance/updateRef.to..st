accessing
updateRef: nameString to: valueString
	| pathReference |
	pathReference := nameString isString 
		ifTrue: [ baseDir resolve: nameString]
		ifFalse: [ nameString ].
		
	pathReference parent ensureDirectory.
	pathReference ensureDeleted writeStreamDo: [ :stream | 
		stream 
			nextPutAll: valueString; 
			nextPut: Character lf ]