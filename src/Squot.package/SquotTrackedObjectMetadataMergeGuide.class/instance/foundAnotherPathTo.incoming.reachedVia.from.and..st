callbacks
foundAnotherPathTo: workingObjectReflection incoming: incomingObjectReflection reachedVia: aReference from: workingReferrerReflection and: incomingReferrerReflection
	"Irrelevant for metadata which must not have multiple references to the same object."
	"Answer is independent of whether this is a new object or an existing one. Numbers, Symbols, nil, true, false can appear multiple times, everything else not."
	^ self foundAnotherPathToNew: incomingObjectReflection reachedVia: aReference from: incomingReferrerReflection