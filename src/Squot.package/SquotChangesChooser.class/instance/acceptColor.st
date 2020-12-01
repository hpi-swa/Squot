ui toolbuilder
acceptColor
	^ self userInterfaceTheme acceptColor
		ifNil: [self userInterfaceTheme get: #okColor for: #DialogWindow]