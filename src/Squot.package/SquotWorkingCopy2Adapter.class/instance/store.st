accessing
store
	^ fakeStore ifNil: [fakeStore := SquotLegacyImageStoreFake for: workingCopy]