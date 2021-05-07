accessing
timestamp
	self exists ifFalse: [^ self error: 'Cannot read timestamp'].
	^ (self directory / 'timestamp') contents asDateAndTime