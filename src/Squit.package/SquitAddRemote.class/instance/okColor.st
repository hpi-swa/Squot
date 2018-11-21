toolbuilder
okColor
	^ self userInterfaceTheme okColor
		ifNil: [self userInterfaceTheme get: #okColor for: #DialogWindow]