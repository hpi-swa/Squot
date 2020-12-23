instance creation
into: aWorkingCopy merge: incomingObject basedOn: baseObject
	self flag: #deprecated. 'Compute differences in the caller and use full constructor for the merge instead'.
	^ self new
		working: aWorkingCopy;
		incoming: incomingObject;
		base: baseObject;
		computeDifferences;
		yourself