instance creation
forProject: aString
	^ self forWorkingCopy: (SqueakWorkingCopy named: aString)