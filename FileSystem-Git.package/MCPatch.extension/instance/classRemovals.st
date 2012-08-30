*FileSystem-Git-Monticello
classRemovals
	^ operations select: [ :operation| 
			operation isRemoval and: [operation definition isClassDefinition]]