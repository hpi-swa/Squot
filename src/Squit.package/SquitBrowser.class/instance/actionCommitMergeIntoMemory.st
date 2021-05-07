actions on versions
actionCommitMergeIntoMemory
	self withUnitOfWork:
	[self projectSelection mergeVersionWithLoadedObjects: self commitSelection ifCanceled: []]