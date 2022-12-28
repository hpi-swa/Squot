callbacks
disappeared: incomingObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"Irrelevant for metadata merge, if there were changes in this portion of the metadata, this would have registered as a reference change or addition as new object elsewhere."
	^ skipBlock value