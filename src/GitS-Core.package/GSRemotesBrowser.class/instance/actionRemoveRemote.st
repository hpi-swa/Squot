actions
actionRemoveRemote
	self unitOfWork removeRemoteNamed: (self selectedRemoteName ifNil: [^ self]).