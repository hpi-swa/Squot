icon
icon
	self createsCommit ifFalse: [^ self lineIcon].
	self isCommitModified ifTrue: [^ self modifiedCommitIcon].
	self editsMessage ifTrue: [^ self messageEditCommitIcon].
	^ self commitIcon