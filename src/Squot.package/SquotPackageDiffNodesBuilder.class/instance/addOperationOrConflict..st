node creation
addOperationOrConflict: aMCOperationOrConflict
	(groups at: aMCOperationOrConflict definition squotGroup ifAbsentPut: [OrderedCollection new])
		add: aMCOperationOrConflict.