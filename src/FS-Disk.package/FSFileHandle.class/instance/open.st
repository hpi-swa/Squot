public
open
	id := self basicOpen.
	id ifNil: 	[
		reference exists ifFalse: [FSFileDoesNotExist signalWith: reference].
		self error: 'Unable to open file ' , reference printString]