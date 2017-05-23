private
addNewObjectsIn: aCommit to: packFileCreator basedOn: remoteRefHashes
	| baseCommit |
	packFileCreator addObject: aCommit.
	baseCommit := aCommit mergeBaseWithAnyOf: remoteRefHashes.
	baseCommit
		ifNil: [packFileCreator addObject: aCommit; visit: aCommit  tree]
		ifNotNil: [(GitDiffCreator new diffTrees: baseCommit tree and: aCommit tree)
				do: [:each | each rightSide
						ifNotNil: [:new | packFileCreator addObject: new object]]].