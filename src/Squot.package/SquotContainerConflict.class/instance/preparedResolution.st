accessing
preparedResolution
	^ preparedResolution ifNil: [preparedResolution := working resolveConflictWith: incoming]