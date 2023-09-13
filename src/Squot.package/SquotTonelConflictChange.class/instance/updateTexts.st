ui
updateTexts
	self isResolved ifFalse: [^ self].
	self texts: (self isInEditMode
		ifTrue: [self resolutionSources ifNil: [self missingSources]]
		ifFalse: [self diffSources]).