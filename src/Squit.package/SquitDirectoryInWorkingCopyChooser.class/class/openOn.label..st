instance creation
openOn: aDirectory label: aString
	^ self new
		workingCopyDirectory: aDirectory;
		directory: aDirectory;
		message: aString;
		getUserResponse