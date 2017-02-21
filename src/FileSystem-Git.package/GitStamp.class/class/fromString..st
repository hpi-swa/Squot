instance creation
fromString: aString
	^ self readFrom: (ReadStream on: aString)