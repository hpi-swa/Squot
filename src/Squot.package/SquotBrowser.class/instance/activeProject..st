accessing
activeProject: aString
	aString ifNil: [^ self activeWorkingCopy: nil].
	self activeWorkingCopy: (SqueakWorkingCopy named: aString).