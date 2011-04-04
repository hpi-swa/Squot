public
open
	self basicOpen.
	id ifNil: 
		[(writable or: [reference exists]) 
			ifTrue: [self error: 'Unable to open file ' , reference printString]
			ifFalse: [FSFileDoesNotExist signalWith: reference]]