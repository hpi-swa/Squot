accessing
selectedRemote
	^ self unitOfWork remoteNamed: (self selectedRemoteName ifNil: [^ nil])