updating
registryChanged
	self changed: #projectList.
	(self activeWorkingCopy ifNil: [^ self]) isRegistered ifFalse: [
		self activeWorkingCopy: nil].