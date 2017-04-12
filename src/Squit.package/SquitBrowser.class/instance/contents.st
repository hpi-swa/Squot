ui
contents
	self commitSelection ifNil: [^ ''].
	^ self commitSelection summary