callbacks
conflictingChanged: workingTargetReflection to: incomingTargetReflection base: baseTargetReflection at: pathCollection
	"Normal graph merges would add the conflict to the object merge."
	| objectMerge |
	objectMerge := self currentMerge.
	objectMerge addConflict:
		(SquotObjectReferenceConflict
			key: pathCollection last
			base: baseTargetReflection object
			working: workingTargetReflection object
			incoming: incomingTargetReflection object).