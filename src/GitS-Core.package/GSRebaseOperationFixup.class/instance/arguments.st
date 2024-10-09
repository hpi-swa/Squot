accessing
arguments
	^ (self keepCurrentMessage
		ifTrue: [self editMessage ifTrue: ['-c'] ifFalse: ['-C']]
		ifFalse: ['']), super arguments