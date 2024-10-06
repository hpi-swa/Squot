accessing
name: aString
	self name: aString ifTaken: [self error: 'Cannot rename to a name that is already taken.'].