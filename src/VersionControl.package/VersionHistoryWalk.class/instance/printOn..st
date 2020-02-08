printing
printOn: stream
	self atEnd
		ifTrue: [stream nextPutAll: 'a finished '; nextPutAll: self class name]
		ifFalse:
			[super printOn: stream.
			stream
				nextPutAll: ' with next ';
				print: self peek].