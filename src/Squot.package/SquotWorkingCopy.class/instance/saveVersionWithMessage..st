creating new versions
saveVersionWithMessage: aString
	self flag: #temporary. "Temporary abstraction for SquotToggles enableRefactoredSave"
	SquotToggles enableRefactoredSave
		ifTrue: [self newSaveOperation
				message: aString;
				applyToWorkingCopy]
		ifFalse: [self saveNewVersionMessage: aString interactive: false].