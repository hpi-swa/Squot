git-delegating
timeStampOfCommit
	revision
		ifNotNil: [ ^ revision committer timeStamp ]
		ifNil: [ ^ nil ]