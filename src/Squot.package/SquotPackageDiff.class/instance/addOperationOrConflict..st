*Squot-Tools
addOperationOrConflict: aMCPatchOperationOrConflict
	self assert: aMCPatchOperationOrConflict isConflict not.
	patch squotAddOperation: aMCPatchOperationOrConflict.