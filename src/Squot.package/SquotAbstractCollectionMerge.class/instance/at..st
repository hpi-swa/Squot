accessing
at: key
	^ self conflictAt: key ifAbsent: [self modificationAt: key ifAbsent: [self mergeAt: key]]