accessing
change
	^ change ifNil: [change := self changeClass withChangeSet: self]