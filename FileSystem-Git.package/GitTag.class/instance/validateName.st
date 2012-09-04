validating
validateName
	self name ifNotNil: [ ^ self ].
	
	GitInvalidObjectError signal: 'Tag name is required.' 