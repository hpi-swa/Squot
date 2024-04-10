actions
actionRun
	self continueBlock
		ifNil: [self run]
		ifNotNil: [self continue].