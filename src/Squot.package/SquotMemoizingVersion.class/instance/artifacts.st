accessing
artifacts
	^ snapshot
		ifNil: [self populateSnapshot artifacts]
		ifNotNil: [snapshot artifacts]