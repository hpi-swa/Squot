callbacks
foundAnotherPathTo: workingObjectReflection incoming: incomingObjectReflection reachedVia: aReference from: workingReferrerReflection and: incomingReferrerReflection
	"Irrelevant for metadata which must not have multiple references to the same object."
	self error: 'Multiple paths'