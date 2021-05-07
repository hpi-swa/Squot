instance creation
name: nameString email: emailString timeStamp: aDateAndTime
	^ self basicNew 
		setName: nameString
		email: emailString
		timeStamp: aDateAndTime;
		beReadOnlyObject;
		yourself