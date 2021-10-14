actions
actionCloneAndMerge

	| operation |
	
	operation := SwaSquitInteractiveClone new.
	[operation clone] on: SquitBadRemote do: [:e | e retry].
	self changed: #repositoryList.
	self selectRepository: operation repository.
	self actionMergeInteractive: false.
	Project current addDeferredUIMessage: [self refresh].
	self browseRepository.
	self refresh.