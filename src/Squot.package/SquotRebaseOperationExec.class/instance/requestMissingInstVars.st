requesting
requestMissingInstVars
	super requestMissingInstVars.
	self command isEmptyOrNil ifTrue: [self command: (self request: 'Command:')].