initialization
setItem: aCommit
	super setItem: aCommit.
	self string: ({
		self formatTimeStamp: aCommit committer timeStamp.
		aCommit author name.
		(self decorationsFor: aCommit), (aCommit message lineNumber: 1).
	} joinSeparatedBy: Character tab).
