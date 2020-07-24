actions
actionCommit
	| workingCopy |
	self hasProjectSelection ifFalse: [^ self].
	workingCopy := self projectSelection.
	self withUnitOfWork:
	[SquotToggles enableRefactoredSave
		ifTrue:
			[SquotGUI waitFor:
				((workingCopy newInteractiveSaveOperation
						title: 'Select changes and message for the new version';
						applyToWorkingCopy)
					then: [:result | self refresh])]
		ifFalse:
			[self waitFor:
				(workingCopy future saveNewVersionInteractivelyIfCanceled: [])]].