actions
continueAddRemote: aSquitAddRemote
	| gitRepository |
	aSquitAddRemote hasBeenAccepted ifFalse: [^ self].
	gitRepository := self gitRepository.
	gitRepository addRemote: aSquitAddRemote remoteName url: aSquitAddRemote remoteUrl.
	self changed: #remotesLabels.
	(UIManager default confirm: 'Do you want to fetch from remote ', aSquitAddRemote remoteName, ' now?')
		ifTrue: [gitRepository fetchFrom: aSquitAddRemote remoteName].