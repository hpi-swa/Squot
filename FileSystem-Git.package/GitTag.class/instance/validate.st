validating
validate
	self name ifNil: [ GitInvalidObjectError signal: 'Tag name is required.' ].
	self object ifNil: [ GitInvalidObjectError signal: 'Cannot have a tag without a tagged object.' ].
	self isLightWeightTag ifTrue: [ ^ self ].
	super validate.
	self tagger ifNil: [ GitInvalidObjectError signal: 'Tagger identity is required for full tags.' ]