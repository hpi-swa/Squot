Squot repository
versionNamed: aString ifAbsent: aBlock
	| version |
	^ (version := SquotFileTestVersion named: aString in: self)
		exists
			ifTrue: [version]
			ifFalse: [aBlock value]