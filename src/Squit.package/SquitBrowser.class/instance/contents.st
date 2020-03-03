ui
contents
	self commitSelection ifNil: [^ ''].
	^ self withUnitOfWork: [self commitSelectionWrapped summary]