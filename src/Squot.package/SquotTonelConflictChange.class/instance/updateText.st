ui
updateText
	self isResolved ifFalse: [^ self].
	self text: (self isInEditMode
		ifTrue: [self resolution
					ifNil: [SquotTextUtilities italic: 'Missing']
					ifNotNil: [:definition | definition squotSource asText]]
		ifFalse: [SquotTextUtilities diffFrom: self leftString to: self resolutionString]).