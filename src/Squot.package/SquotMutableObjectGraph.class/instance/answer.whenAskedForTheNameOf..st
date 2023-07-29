adding
answer: aName whenAskedForTheNameOf: anObject
	"Make sure nameOf: anObject will answer aName. But objectNamed: aName should not answer anObject, because anObject might also be a shadow."
	self assert: anObject hasSquotShadowName not
		description: 'Must not put decorated objects in dictionary'.
	self assert: (objectNames at: anObject ifAbsent: [aName]) = aName
		description: 'Objects must not be renamed'.
	self assert: (SquotObjectName isSquotObjectName: aName)
		description: 'Unexpected object name, check senders'.
	objectNames at: anObject put: aName.