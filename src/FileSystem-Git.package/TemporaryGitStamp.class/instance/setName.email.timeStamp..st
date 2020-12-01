initialize-release
setName: nameString email: emailString timeStamp: aDateAndTime
	super setName: nameString email: emailString timeStamp: aDateAndTime.
	oldName := DefaultName.
	oldEmail := DefaultEmail.