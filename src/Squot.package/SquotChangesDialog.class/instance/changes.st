accessing
changes
	^ changes ifNil: [changes := self computeChanges]