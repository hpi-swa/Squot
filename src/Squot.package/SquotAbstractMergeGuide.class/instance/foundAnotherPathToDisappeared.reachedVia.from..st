callbacks for objects
foundAnotherPathToDisappeared: incomingObjectReflection reachedVia: aReference from: incomingReferrerReflection
	"Note that the same incoming object that does not exist in the working copy was encountered once more via a different path into the incoming object graph."
	self subclassResponsibility