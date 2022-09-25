callbacks
foundAnotherPathTo: workingObjectReflection incoming: incomingObjectReflection reachedVia: aReference from: workingReferrerReflection and: incomingReferrerReflection
	"Add deep difference hints if the workingReferent object is already known to have any differences."
	| existingMerge referrerMerge |
	existingMerge := merges at: (working nameOf: workingObjectReflection object undecorated ifAbsent: []) ifAbsent: [^ self].
	existingMerge hasChanges ifFalse: [^ self].
	referrerMerge := merges at: (working nameOf: workingReferrerReflection object undecorated ifAbsent: []).
	referrerMerge addReferenceDiff:
		(SquotDifferentReferenceTarget
			reference: aReference
			leftOwner: workingReferrerReflection object target: workingObjectReflection object
			rightOwner: incomingReferrerReflection object target: incomingObjectReflection object).