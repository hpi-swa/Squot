callbacks for objects
foundAnotherPathTo: workingObjectReflection incoming: incomingObjectReflection reachedVia: aReference from: workingReferrerReflection and: incomingReferrerReflection
	"Irrelevant for project merges because artifact data are trees."
	self error: 'Multiple paths'.