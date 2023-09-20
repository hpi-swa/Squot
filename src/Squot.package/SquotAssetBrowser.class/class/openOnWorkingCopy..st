instance creation
openOnWorkingCopy: aWorkingCopy
	^ self new
		activeWorkingCopy: aWorkingCopy;
		open