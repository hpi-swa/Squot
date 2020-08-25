instance creation
nowBy: nameString email: emailString
	^ self new 
		setName: nameString
		email: emailString;
		yourself