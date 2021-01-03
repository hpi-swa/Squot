accessing
snapshot
	^ snapshot ifNil: [self populateSnapshot]