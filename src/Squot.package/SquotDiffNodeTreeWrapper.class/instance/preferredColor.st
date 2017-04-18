accessing
preferredColor
	^ item isActive
		ifTrue: [super preferredColor]
		ifFalse: [self userInterfaceTheme excludedDiffItemColor ifNil: [Color gray]]