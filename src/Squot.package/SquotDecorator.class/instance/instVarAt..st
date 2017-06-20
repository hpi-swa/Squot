as yet unclassified
instVarAt: offset
	^ self withArgs: {offset} executeMethod: (Object >> #instVarAt:)