callbacks
foundAnotherPathToNew: incomingObjectReflection reachedVia: aReference from: incomingReferrerReflection
	"Irrelevant for metadata which must not have multiple references to the same object."
	"nil, true, false, numbers and symbols are obviously allowed to appear multiple times"
	(incomingObjectReflection mirror canObjectsHaveMultipleEqualInstances not
		or: [incomingObjectReflection shouldHaveNameAssigned not
				and: [incomingObjectReflection object isNumber]])
		ifTrue: [^ self].
	self error: 'Multiple paths'