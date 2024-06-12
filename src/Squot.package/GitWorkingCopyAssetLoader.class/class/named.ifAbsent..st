instance creation
named: aString ifAbsent: aBlock
	^ self forWorkingCopy: (SqueakWorkingCopy named: aString ifAbsent: [^ aBlock value])