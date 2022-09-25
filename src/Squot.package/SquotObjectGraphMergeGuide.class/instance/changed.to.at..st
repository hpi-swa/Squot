callbacks
changed: workingTargetReflection to: incomingTargetReflection at: pathCollection 
	"Normal graph merges would add the diff to the object merge."
	| objectMerge |
	objectMerge := self currentMerge.
	objectMerge addReferenceDiff:
		(SquotReferenceTargetExchange reference: pathCollection last
			leftOwner: currentWorking object target: workingTargetReflection object
			rightOwner: currentIncoming object target: incomingTargetReflection object).