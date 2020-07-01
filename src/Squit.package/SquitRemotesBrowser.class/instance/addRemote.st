actions
addRemote
	| previouslySelectedRemoteName |
	previouslySelectedRemoteName := self selectedRemoteName.
	SquitInteractiveAddRemote new
		repository: workingCopy repository;
		onRemoteAddedDo:
			[:new |
			Project current addDeferredUIMessage:
				[self changed: #remotesLabels.
				self selectedRemoteName: new remoteName]];
		onRollbackDo:
			[:rolledBack |
			Project current addDeferredUIMessage:
				[self changed: #remotesLabels.
				self selectedRemoteName: previouslySelectedRemoteName]];
		run