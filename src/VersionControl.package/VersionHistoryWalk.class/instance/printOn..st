printing
printOn: stream
	searchFrontier isEmpty "do not use atEnd here to not modify the state"
		ifTrue: [stream nextPutAll: 'a finished '; nextPutAll: self class name]
		ifFalse:
			[super printOn: stream.
			stream
				nextPutAll: ' with next ';
				print: self peek].