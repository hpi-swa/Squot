*Squot-Tools
addOperationOrConflict: aMCPatchOperationOrConflict
	aMCPatchOperationOrConflict isConflict
		ifTrue: [containerConflicts at: (self keyOf: aMCPatchOperationOrConflict definition) put: aMCPatchOperationOrConflict]
		ifFalse: [containerModifications at: (self keyOf: aMCPatchOperationOrConflict definition) put: aMCPatchOperationOrConflict].