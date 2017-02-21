validating
validateTagger
	self tagger ifNotNil: [ ^ self ].
	
	GitInvalidObjectError signal: 'Tagger identity is required for full tags.' 