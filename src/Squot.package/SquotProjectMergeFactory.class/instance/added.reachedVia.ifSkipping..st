callbacks
added: incomingObjectReflection reachedVia: anObject ifSkipping: skipBlock
	"Record artifact addition here or is the reference addition enough?"
	self shouldBeImplemented.
	^ skipBlock value "Do not walk into the artifacts or metadata further"