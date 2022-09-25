instance creation
workingCopySnapshot: workingCopyProjectSnapshot baseSnapshot: baseVersionProjectSnapshot incomingSnapshot: incomingVersionProjectSnapshot
	^ self new
		setWorkingCopySnapshot: workingCopyProjectSnapshot
		baseSnapshot: baseVersionProjectSnapshot
		incomingSnapshot: incomingVersionProjectSnapshot;
		yourself