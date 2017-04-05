public diff creation
diffTrees: fromTree and: toTree
	fromTree hash = toTree hash ifTrue: [^ Dictionary new].
	^ Dictionary newFromPairs: (Array streamContents: [:stream |
		stream nextPut: FSPath workingDirectory;
			nextPut: (GitDiffTreeEntry new
				leftSide: (leftEntry ifNil: [fromTree asTreeEntryNamed: '']);
				rightSide: (rightEntry ifNil: [toTree asTreeEntryNamed: ''])).
		fromTree entries do: [:left |
			leftEntry := left.
			toTree entryAt: left entryName
				ifPresent: [:right | | dict |
					rightEntry := right.
					dict := self diff: left object against: right object.
					dict keysAndValuesDo:
						[:path :change | stream
							nextPut: (FSPath * left entryName resolve: path);
							nextPut: change]]
				ifAbsent: [self putWholeTree: left inLeftSide: stream
						under: FSPath * left entryName]].
		toTree entries do: [:right |
			rightEntry := right.
			(fromTree includesEntryNamed: right entryName)
				ifFalse: [self putWholeTree: right inRightSide: stream
						under: FSPath * right entryName]]])