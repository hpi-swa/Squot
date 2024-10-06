requesting
requestMissingInstVars
	super requestMissingInstVars.
	self assert: self commit notNil description: 'should have a commit by now'.