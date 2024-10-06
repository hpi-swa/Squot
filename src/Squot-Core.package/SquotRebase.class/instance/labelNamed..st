accessing
labelNamed: aString
	^ self labels at: aString ifAbsent: [nil]