private diff creation
putWholeTree: entry inLeftSide: stream under: aPath
	stream nextPut: aPath; nextPut: (GitDiffTreeEntry new leftSide: entry).
	entry isInDirectorymode ifFalse: [^ self].
	entry object entries do: [:each |
		self putWholeTree: each inLeftSide: stream under: aPath / each entryName].