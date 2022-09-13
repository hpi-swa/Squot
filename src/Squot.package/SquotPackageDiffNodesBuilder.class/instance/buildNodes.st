node creation
buildNodes
	groups keysAndValuesDo: [:key :each | each first definition squotBelongsToClass
			ifTrue: [classNodes add: (self createNodeForClass: key operationsAndConflicts: each)]
			ifFalse: [otherNodes add: (self createNodeForDefinitionType: key operationsAndConflicts: each)]].
	classNodes sort: [:a :b | self compareClassNodes: a and: b].
	^ classNodes, otherNodes