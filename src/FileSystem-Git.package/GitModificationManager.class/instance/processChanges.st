operations
processChanges
	self logMessage: 'processChanges'.
	self processBlobs.
	self processCreations.
	self processDeletions.
	self updateIntermediateEntries.