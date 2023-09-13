ui
updateTexts
	self isResolved ifFalse: [^ self changed: #text "trigger styling"].
	self texts: (self isInEditMode
		ifTrue: [self resolutionSources ifNil: [self missingSources]]
		ifFalse: [self diffSources]).