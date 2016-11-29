public-removing
removeEntryAt: aFileName
	entries removeKey: aFileName.
	self flushHash.