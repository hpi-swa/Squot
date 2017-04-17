public
open
	id := self basicOpen.
	id ifNil: 	[
		reference exists ifFalse: [FileDoesNotExist signalWith: reference].
		self error: 'Unable to open file ' , reference printString].
	self registerForFinalization.