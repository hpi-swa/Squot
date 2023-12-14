instance creation
newWithMapper: aPlaintextMapper workingCopy: aWorkingCopy 
	^ self new
		mapper: aPlaintextMapper;
		workingCopy: aWorkingCopy;
		yourself