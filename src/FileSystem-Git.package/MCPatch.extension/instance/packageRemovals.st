*FileSystem-Git-Monticello
packageRemovals
	^ operations select: [ :operation| 
			operation isRemoval and: [operation definition isOrganizationDefinition]]