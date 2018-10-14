actions
removeSelectedRemote
	self isAnyRemoteSelected ifFalse: [^ self].
	self gitRepository removeRemoteNamed: self selectedRemoteName.
	self changed: #remotesLabels;
		selectedRemoteName: nil.