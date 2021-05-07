accessing
findVersionByString: aString
	(self historianNamed: aString) version ifNotNil: [:version | ^ version].
	^ self notYetImplemented