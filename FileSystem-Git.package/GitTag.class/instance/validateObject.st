validating
validateObject
	self object ifNotNil: [ ^ self  ].
	
	GitInvalidObjectError signal: 'Cannot have a tag without a tagged object.'