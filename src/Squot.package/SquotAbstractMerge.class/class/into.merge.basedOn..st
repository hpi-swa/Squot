instance creation
into: aWorkingCopy merge: incomingObject basedOn: baseObject
	^ self new
		working: aWorkingCopy;
		incoming: incomingObject;
		base: baseObject;
		computeDifferences;
		yourself