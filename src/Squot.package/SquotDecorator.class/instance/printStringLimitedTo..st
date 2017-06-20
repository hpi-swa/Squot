as yet unclassified
printStringLimitedTo: anInteger
	^ self withArgs: {anInteger} executeMethod: (Object >> #printStringLimitedTo:)