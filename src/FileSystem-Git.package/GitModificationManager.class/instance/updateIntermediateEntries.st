operations
updateIntermediateEntries
	| last current tree parentTree |
	last := nil.
	[pendingPathsForEntryUpdate notEmpty]
		whileTrue: [current := pendingPathsForEntryUpdate removeFirst.
			(current ~= last and: [current isRoot not and: [(deletedPaths includes: current) not]]) ifTrue: [
				tree := self treeAt: current.
				parentTree := self copiedTreeForModificationAt: current parent.
				tree isEmpty
					ifFalse: [parentTree entryAt: current basename
							ifPresent: [:entry | entry entryHash ~= tree hash
								ifTrue: [self updateEntryWithPath: current in: parentTree
											toTree: tree]]
							ifAbsent: [self updateEntryWithPath: current in: parentTree
										toTree: tree]]
					ifTrue: [(parentTree entryAt: current basename
							ifPresent: [:entry |
								parentTree removeEntryAt: current basename.
								pendingPathsForEntryUpdate add: current parent]
							ifAbsent: [])].
				last := current]].