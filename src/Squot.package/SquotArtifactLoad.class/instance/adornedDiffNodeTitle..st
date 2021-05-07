*Squot-Tools
adornedDiffNodeTitle: aString
	"Add adornments based on the state of the diff to the basic title, aString, and answer it."
	^ self willBeLoaded
		ifTrue: ['load ', (super adornedDiffNodeTitle: aString)]
		ifFalse:
			[ | text |
			text := ('( do not load ', (super adornedDiffNodeTitle: aString), ' )') asText.
			text addAttribute: (TextColor color: (self userInterfaceTheme excludedDiffItemColor ifNil: [(self userInterfaceTheme get: #tempVar for: #SHTextStylerST80) ifNotNil: [:collection | collection detect: [:each | each class = Color] ifNone: []] ifNil: [Color gray]]))]