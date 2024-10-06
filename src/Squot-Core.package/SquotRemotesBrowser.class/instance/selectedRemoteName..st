accessing
selectedRemoteName: aString
	selectedRemoteName := aString.
	self
		changed: #selectedRemoteName;
		changed: #hasSelectedRemote.