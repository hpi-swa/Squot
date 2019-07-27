adding
answer: aName whenAskedForTheNameOf: anObject
	"Make sure nameOf: anObject will answer aName. But objectNamed: aName should not answer anObject."
	self haltIf: anObject hasSquotShadowName.
	self haltIf: (objectNames at: anObject ifAbsent: [aName]) ~= aName. "otherwise this would be a rename operation"
	objectNames at: anObject put: aName.