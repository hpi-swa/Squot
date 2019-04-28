as yet unclassified
= otherObject

	^ self class = otherObject class 
		and: [self ownerSnapshot = otherObject ownerSnapshot]
		and: [self rootDirectory = otherObject rootDirectory]
		and: [trackedFiles = otherObject instVarNamed: #trackedFiles]