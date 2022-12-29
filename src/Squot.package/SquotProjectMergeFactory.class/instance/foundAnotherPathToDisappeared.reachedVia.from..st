callbacks for objects
foundAnotherPathToDisappeared: incomingObjectReflection reachedVia: aReference from: incomingReferrerReflection
	"Irrelevant for project merges because artifact data are trees."
	self error: 'Multiple paths'.