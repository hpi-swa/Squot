accessing
preferredColor
	^ item isActive
		ifTrue: [super preferredColor]
		ifFalse: [self userInterfaceTheme excludedDiffItemColor ifNil: [(self userInterfaceTheme get: #tempVar for: #SHTextStylerST80) ifNotNil: [:collection | collection detect: [:each | each class = Color] ifNone: []] ifNil: [Color gray]]]