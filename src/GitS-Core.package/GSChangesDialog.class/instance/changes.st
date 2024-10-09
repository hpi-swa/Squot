accessing
changes
	^ changes ifNil: [self changes: self computeChanges. changes]