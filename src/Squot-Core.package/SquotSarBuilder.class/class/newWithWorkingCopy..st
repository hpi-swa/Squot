instance creation
newWithWorkingCopy: aWorkingCopy
	^ self new
		workingCopy: aWorkingCopy;
		yourself