as yet unclassified
actionCommitAndThenDo: aBlock

	| workingCopy |
	self hasSelectedRepository ifFalse: [^ self].
	
	workingCopy := self selectedRepository.
	self withUnitOfWork: [
		[SquotGUI waitFor:
			((workingCopy newInteractiveSaveOperation
					title: 'Select changes and message for the new version';
					applyToWorkingCopy)
				then: [:result | self refresh. aBlock value]
				ifRejected: [:reason | nil])]
			on: BrokenPromise do: [:e | e ifNotError: []]].