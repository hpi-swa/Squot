*Squot-Tools
removeOperationOrConflict: aMCPatchOperationOrConflict
	self assert: aMCPatchOperationOrConflict isConflict not.
	patch squotRemoveOperation: aMCPatchOperationOrConflict.