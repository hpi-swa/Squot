operations
processChanges
	self processBlobs.
	self processCreations.
	self processDeletions.
	self updateIntermediateEntries.
	self storeTrees.