actions
actionCommit
	| workingCopy |
	self hasProjectSelection ifFalse: [^ self].
	workingCopy := self projectSelection.
	self withUnitOfWork:
		[[SquotGUI waitFor:
			((workingCopy newInteractiveSaveOperation
					title: 'Select changes and message for the new version';
					applyToWorkingCopy)
				then: [:result | self refresh]
				ifRejected: [:reason | nil])]
			on: BrokenPromise do: [:e | e ifNotError: []]].