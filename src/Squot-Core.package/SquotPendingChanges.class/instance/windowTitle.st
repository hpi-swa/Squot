accessing
windowTitle
	^ self alwaysOpenDialog
		ifTrue: [self basicWindowTitle]
		ifFalse: ['Resolve conflicts to ', self basicWindowTitle withFirstCharacterDownshifted]