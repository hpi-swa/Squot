instance creation
newWithName: aString
	^ self new
		name: aString;
		register;
		yourself