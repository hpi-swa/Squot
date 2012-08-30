operations
processChanges
	self processBlobs.
	self processCreations.
	self processDeletions.
	self storeTrees.