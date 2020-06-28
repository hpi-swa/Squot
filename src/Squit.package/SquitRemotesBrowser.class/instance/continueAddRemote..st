actions
continueAddRemote: aSquitAddRemote
	| gitRepository previouslySelectedRemoteName |
	aSquitAddRemote hasBeenAccepted ifFalse: [^ self].
	previouslySelectedRemoteName := self selectedRemoteName.
	self withUnitOfWork:
	[gitRepository := self gitRepository.
	gitRepository addRemote: aSquitAddRemote remoteName url: aSquitAddRemote remoteUrl.
	self changed: #remotesLabels.
	self selectedRemoteName: aSquitAddRemote remoteName.
	(UIManager default confirm: 'Do you want to fetch from remote ', aSquitAddRemote remoteName, ' now?')
		ifTrue: [(SquitInteractiveFetch
				repository: workingCopy repository
				remoteNames: {aSquitAddRemote remoteName})
				run
					ifRejected: [:reason |
						self withUnitOfWork: 
							[gitRepository removeRemoteNamed: aSquitAddRemote remoteName.
							aSquitAddRemote afterCloseContinueIn: self with: #continueAddRemote:.
							Project current addDeferredUIMessage:
								[self changed: #remotesLabels.
								self selectedRemoteName: previouslySelectedRemoteName.
								aSquitAddRemote openAgain]]]]].