actions
actionCommit
	self withUnitOfWork:
	[SquotToggles enableRefactoredSave
		ifTrue:
			[(self projectSelection newInteractiveSaveOperation
				title: 'Select changes and message for the new version';
				applyToWorkingCopy)
				then: [:result | self refresh]]
		ifFalse: [self projectSelection saveNewVersionInteractivelyIfCanceled: [^ self]]].