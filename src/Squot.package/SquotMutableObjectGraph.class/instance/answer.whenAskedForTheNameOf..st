adding
answer: aName whenAskedForTheNameOf: anObject
	"Make sure nameOf: anObject will answer aName. But objectNamed: aName should not answer anObject."
	self assert: anObject hasSquotShadowName not
		description: 'Must not put decorated objects in dictionary'.
	self assert: (objectNames at: anObject ifAbsent: [aName]) = aName
		description: 'Objects must not be renamed'.
	objectNames at: anObject put: aName.