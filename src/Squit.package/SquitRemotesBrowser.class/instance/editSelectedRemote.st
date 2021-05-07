actions
editSelectedRemote
	| previouslySelectedRemoteName |
	self flag: #remoteRepository.
	previouslySelectedRemoteName := self selectedRemoteName.
	self withUnitOfWork:
		[(SquitInteractiveEditRemote
			repository: workingCopy repository
			remote: (workingCopy repository git remoteNamed: previouslySelectedRemoteName))
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
			run]