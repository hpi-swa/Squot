requesting
requestMissingInstVars
	super requestMissingInstVars.
	self label isEmptyOrNil ifTrue: [self label: (self request: 'Label:')].