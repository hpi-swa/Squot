*Squot-Tools
removeOperationOrConflict: aMCPatchOperationOrConflict
	aMCPatchOperationOrConflict isConflict
		ifTrue: [containerConflicts removeKey: (self keyOf: aMCPatchOperationOrConflict definition)]
		ifFalse: [containerModifications removeKey: (self keyOf: aMCPatchOperationOrConflict definition)].