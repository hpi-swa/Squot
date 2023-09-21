operations
materializeIn: aWorkingCopy
	self isExcluded ifTrue: [^ self].
	self mapper materialize: self versionToWrite in: aWorkingCopy.