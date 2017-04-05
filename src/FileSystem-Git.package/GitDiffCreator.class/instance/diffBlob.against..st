private diff creation
diffBlob: leftBlob against: rightObject
	rightObject isTree
		ifTrue: [^ Dictionary newFromPairs:
			{FSPath workingDirectory.
			GitDiffTreeEntry new leftSide: leftEntry; rightSide: rightEntry}]
		ifFalse: [^ self diffBlobs: leftBlob and: rightObject].