private diff creation
putWholeTree: entry inRightSide: stream under: aPath
	stream nextPut: aPath; nextPut: (GitDiffTreeEntry new rightSide: entry).
	entry isInDirectoryMode ifFalse: [^ self].
	entry object entries do: [:each |
		self putWholeTree: each inRightSide: stream under: aPath / each entryName].