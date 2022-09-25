private accessing
currentMerge
	currentWorking object == working ifTrue: [^ merges at: self graphId].
	^ merges at: (working nameOf: currentWorking object undecorated).