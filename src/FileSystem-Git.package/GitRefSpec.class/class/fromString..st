instance creation
fromString: aString 
	^ self new
		parseString: aString;
		yourself