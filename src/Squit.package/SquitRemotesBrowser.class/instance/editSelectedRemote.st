actions
editSelectedRemote
	| previouslySelectedRemoteName |
	previouslySelectedRemoteName := self selectedRemoteName.
	self withUnitOfWork:
		[SquitInteractiveEditRemote new
			repository: workingCopy repository;
			remote: (workingCopy repository git remoteNamed: previouslySelectedRemoteName);
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