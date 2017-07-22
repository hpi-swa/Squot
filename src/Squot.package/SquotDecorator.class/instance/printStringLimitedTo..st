Object
printStringLimitedTo: anInteger
	^ self withArgs: {anInteger} executeMethod: (Object >> #printStringLimitedTo:)