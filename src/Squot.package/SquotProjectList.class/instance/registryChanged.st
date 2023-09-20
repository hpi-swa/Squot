updating
registryChanged
	self changed: #list.
	(self workingCopy ifNil: [^ self]) isRegistered ifFalse: [self workingCopy: nil].