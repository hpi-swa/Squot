operations
materializeIn: aWorkingCopy
	self isExcluded ifTrue: [^ self].
	self mapper materialize: self assetFileToWrite in: aWorkingCopy.