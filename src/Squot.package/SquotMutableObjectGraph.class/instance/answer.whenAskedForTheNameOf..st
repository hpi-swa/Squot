adding
answer: aName whenAskedForTheNameOf: anObject
	"Make sure nameOf: anObject will answer aName. But objectNamed: aName should not answer anObject."
	objectNames at: anObject put: aName.