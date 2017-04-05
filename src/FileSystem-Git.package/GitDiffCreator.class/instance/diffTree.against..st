private diff creation
diffTree: leftTree against: rightObject
	rightObject isTree
		ifTrue: [^ self diffTrees: leftTree and: rightObject]
		ifFalse: [^ Dictionary newFromPairs:
			{FSPath workingDirectory.
			GitDiffTreeEntry new leftSide: leftEntry; rightSide: rightEntry}].