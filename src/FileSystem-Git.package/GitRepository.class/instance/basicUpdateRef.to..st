private
basicUpdateRef: refPath to: aString
	| pathReference |
	self privateDeprecatedUseUnitOfWork.
	self flag: 'rather make sure we never get strings in here...'.
	pathReference := refPath isString 
		ifTrue: [self baseDir resolve: refPath]
		ifFalse: [ refPath ].
		
	pathReference parent ensureDirectory.
	pathReference ensureDeleted writeStreamDo: [ :stream | 
		stream 
			nextPutAll: aString; 
			nextPut: Character lf ]