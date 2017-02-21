public-removing
removeEntryAt: aFileName ifAbsent: aBlock
	entries removeKey: aFileName ifAbsent: aBlock.
	self flushHash.