actions
mergeVersionIntoActiveBranch: mergeHeadCommit ifCanceled: cancelBlock
	| selectedProject |
	selectedProject := self projectSelection.
	(self waitFor: (selectedProject future
		mergeVersionInteractively: mergeHeadCommit
		ifCanceled: [])) ifNil: [^ self].
	selectedProject loadedHistorian version
		 ifNil: ["new branch that got an ancestor now"
			self isThisEverCalled: 'branch adoption by SquitBrowser'. "cf. #mergeVersionInteractively:ifCanceled: and #addParentVersion:"
			selectedProject loadedHistorian version: mergeHeadCommit.
			selectedProject loadedVersion: mergeHeadCommit.
			^ self].
	(selectedProject loadedHistorian version = mergeHeadCommit)
		ifTrue: ["fast-forward merge" ^ self].
	[self actionCommit]
		on: SquotInitialLogMessageRequested
		do: [:request | request isNested
			ifTrue: [request pass]
			ifFalse: [request resume: 'Merge branch ', selectedHistorian shortName]].