callbacks for objects
foundAnotherPathTo: workingObjectReflection incoming: incomingObjectReflection reachedVia: aReference from: workingReferrerReflection and: incomingReferrerReflection
	"Note that the same object was encountered once more via a different path into the object graph."
	self subclassResponsibility