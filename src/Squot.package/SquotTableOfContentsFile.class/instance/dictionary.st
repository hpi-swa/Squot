private accessing
dictionary
	^ collection ifNil: [self fileIn. collection]