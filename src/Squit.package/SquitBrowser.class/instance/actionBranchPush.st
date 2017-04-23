actions
actionBranchPush
	| historian branchName repository remoteName remoteUrl |
	historian := self branchSelection historian.
	branchName := historian name.
	repository := self projectSelection repository.
	remoteName := repository gitRepository repository configAt: 'branch.', branchName, '.remote'.
	remoteUrl := repository gitRepository remoteUrl: remoteName.
	(self ensureCredentials: repository remoteUrl: remoteUrl) ifFalse: [^ self].
	self projectSelection repository
		exportToUpstream: historian
		ifNone: [UIManager default inform: 'No upstream branch configured for ', branchName]