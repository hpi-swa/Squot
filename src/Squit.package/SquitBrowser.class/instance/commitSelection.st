accessing
commitSelection
	^ commitSelection ifNil: [
		self commitList ifNotEmpty: [:list | commitSelection := list first ].
		commitSelection]