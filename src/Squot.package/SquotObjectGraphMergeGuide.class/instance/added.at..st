callbacks
added: incomingTargetReflection at: pathCollection
	"Normal graph merges would add the addition to the object merge."
	| objectMerge |
	currentWorking object ifNil: [^ self "ignore changes in objects that do not exist in the working copy"].
	objectMerge := self currentMerge.
	objectMerge addReferenceDiff:
		(SquotReferenceAddition to: currentWorking object
			reference: pathCollection last
			target: incomingTargetReflection object
			rightOwner: currentIncoming object).
	self flag: #todo. "What if there are deep differences behind the added object?"