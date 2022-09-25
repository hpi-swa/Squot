accessing
content: anObject

	SquotToggles useNewApi & anObject notNil ifTrue: [self deprecated].
	content := anObject