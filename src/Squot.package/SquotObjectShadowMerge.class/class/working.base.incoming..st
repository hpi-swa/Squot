instance creation
working: workingObjectShadow base: baseObjectShadow incoming: incomingObjectShadow
	^ self new
		setWorking: workingObjectShadow incoming: incomingObjectShadow base: baseObjectShadow;
		yourself