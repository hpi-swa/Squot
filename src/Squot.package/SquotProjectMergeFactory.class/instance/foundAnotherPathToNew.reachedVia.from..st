callbacks for objects
foundAnotherPathToNew: incomingObjectReflection reachedVia: aReference from: incomingReferrerReflection
	"Irrelevant for project merges because artifact data are trees."
	self error: 'Multiple paths'.