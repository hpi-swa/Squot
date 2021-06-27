Object
instVarAt: offset
	^ self withArgs: {offset} executeMethod: (Object >> #instVarAt:)