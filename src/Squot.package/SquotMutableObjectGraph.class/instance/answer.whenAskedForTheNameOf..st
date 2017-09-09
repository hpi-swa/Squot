adding
answer: aName whenAskedForTheNameOf: anObject
	"Make sure nameOf: anObject will answer aName. But objectNamed: aName should not answer anObject."
	self haltIf: anObject hasSquotShadowName.
	objectNames at: anObject put: aName.