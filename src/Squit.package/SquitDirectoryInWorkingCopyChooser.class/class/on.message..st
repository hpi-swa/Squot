instance creation
on: aDirectory message: aString
	^ self new
		workingCopyDirectory: aDirectory;
		directory: aDirectory;
		message: aString;
		getUserResponse