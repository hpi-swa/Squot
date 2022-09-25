callbacks
prepareMerge: workingObjectReflection with: incomingObjectReflection basedOn: baseObjectReflection reachedVia: anObject ifSkipping: skipBlock
	"Project merges spawn artifact merging here."
	self shouldBeImplemented.
	^ skipBlock value "Do not walk into the artifacts or metadata further"