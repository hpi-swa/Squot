as yet unclassified
setItem: aCommit
	super setItem: aCommit.
	self string: ({
		self formatTimeStamp: aCommit committer timeStamp.
		aCommit author name.
		aCommit message lineNumber: 1.
	} joinSeparatedBy: Character tab).
