public diff creation
diffBlobs: leftBlob and: rightBlob
	leftBlob hash = rightBlob hash ifTrue: [^ Dictionary new].
	^ Dictionary newFromPairs:
		{FSPath workingDirectory.
		GitDiffTreeEntry new leftSide: leftEntry; rightSide: rightEntry}