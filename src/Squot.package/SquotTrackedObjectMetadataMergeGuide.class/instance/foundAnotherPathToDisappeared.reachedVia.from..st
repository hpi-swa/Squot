callbacks
foundAnotherPathToDisappeared: incomingObjectReflection reachedVia: aReference from: incomingReferrerReflection
	"Irrelevant for metadata which must not have multiple references to the same object."
	self error: 'Multiple paths'