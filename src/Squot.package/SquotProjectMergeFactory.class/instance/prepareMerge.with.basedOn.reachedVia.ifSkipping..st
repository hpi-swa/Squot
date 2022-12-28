callbacks
prepareMerge: workingObjectReflection with: incomingObjectReflection basedOn: baseObjectReflection reachedVia: anObject ifSkipping: skipBlock
	"Project merges spawn artifact merging here."
	workingObjectReflection object == workingProjectSnapshot ifTrue: [^ self]. "Only prepare anything for artifact merges."
	self compareConsolidatedIncomingArtifact: incomingObjectReflection object.
	^ skipBlock value "Do not walk into the artifacts or metadata further"