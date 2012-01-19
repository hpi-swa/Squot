converting
pathFromString: aString

	^ ((aString first isLetter and: [aString second = $:])
		ifTrue: [ FSAbsolutePath ]
		ifFalse: [ FSRelativePath ])
			from: aString delimiter: self delimiter