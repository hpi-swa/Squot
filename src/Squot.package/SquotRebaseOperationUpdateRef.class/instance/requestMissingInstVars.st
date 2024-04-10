requesting
requestMissingInstVars
	super requestMissingInstVars.
	self ref isEmptyOrNil ifTrue: [self ref: (self request: 'Ref:')].