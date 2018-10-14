accessing
selectedRemoteName: aString
	selectedRemoteName = aString ifTrue: [^ self].
	selectedRemoteName := aString.
	self changed: #selectedRemoteName;
		changed: #isAnyRemoteSelected.