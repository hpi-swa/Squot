accessing
author
	self exists ifFalse: [^ self error: 'Cannot read author'].
	^ (self directory / 'author') contents