instance creation
newWithNameAndRegister: aString
	^ self new
		name: aString;
		register;
		yourself