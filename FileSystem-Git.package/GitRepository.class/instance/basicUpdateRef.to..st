private
basicUpdateRef: refPath to: aString
	| target pathReference |
	target := [(self baseDir resolve: refPath) readStreamDo: [ :stream | stream contents ]]
		on: FSFileDoesNotExist do: [:ex | ex return: nil].

	(target isNil not and: [target beginsWith: 'ref:']) ifTrue: [
		^ self updateRef: (target allButFirst: 4) withBlanksTrimmed to: aString ].
	
	self flag: 'rather make sure we never get strings in here...'.
	pathReference := refPath isString 
		ifTrue: [self baseDir resolve: refPath]
		ifFalse: [ refPath ].
		
	pathReference parent ensureDirectory.
	pathReference writeStreamDo: [ :stream | 
		stream 
			nextPutAll: aString; 
			nextPut: Character lf ]