*FileSystem-Git-Monticello
methodRemovals
	^ operations select: [ :operation| 
			operation isRemoval and: [operation definition isMethodDefinition]]