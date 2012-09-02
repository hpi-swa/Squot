git-delegating
timeStampOfCreation
	revision
		ifNotNil: [ ^ revision author timeStamp ]
		ifNil: [ ^ nil ]