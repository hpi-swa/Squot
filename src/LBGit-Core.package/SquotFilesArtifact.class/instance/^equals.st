as yet unclassified
= otherObject

	^ self class = otherObject class 
		and: [self objectContainer = otherObject objectContainer]
		and: [self rootDirectory = otherObject rootDirectory]
		and: [trackedFiles = (otherObject instVarNamed: #trackedFiles)]