callbacks
prepareMerge: workingObjectReflection with: incomingObjectReflection basedOn: baseObjectReflection reachedVia: anObject ifSkipping: skipBlock
	workingObjectReflection object = incomingObjectReflection object ifTrue: [^ skipBlock value].
	"Otherwise irrelevant for metadata merge."