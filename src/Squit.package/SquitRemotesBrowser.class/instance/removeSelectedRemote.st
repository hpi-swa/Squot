actions
removeSelectedRemote
	self isAnyRemoteSelected ifFalse: [^ self].
	self withUnitOfWork:
	[self gitRepository removeRemoteNamed: self selectedRemoteName.
	self changed: #remotesLabels;
		selectedRemoteName: nil].