ui
contents
	self commitSelection ifNil: [^ ''].
	^ self commitSelectionWrapped summary