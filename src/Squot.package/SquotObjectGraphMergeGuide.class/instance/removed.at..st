callbacks
removed: workingTargetReflection at: pathCollection
	"Normal graph merges would add the removal to the object merge."
	| objectMerge |
	objectMerge := self currentMerge.
	objectMerge addReferenceDiff:
		(SquotReferenceRemoval of: workingTargetReflection object
			from: currentWorking object
			reference: pathCollection last
			rightObject: currentIncoming object).
	self flag: #todo. "What if there are deep differences between nextInBase and nextInWorking?"