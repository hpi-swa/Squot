operations
updateIntermediateEntries
	| last current tree parentTree |
	last := nil.
	[pendingPathsForEntryUpdate notEmpty]
		whileTrue: [current := pendingPathsForEntryUpdate removeFirst.
			(current ~= last and: [current isRoot not and: [(deletedPaths includes: current) not]]) ifTrue: [
				tree := self treeAt: current.
				parentTree := self treeAt: current parent.
				tree isEmpty
					ifFalse: [(parentTree entryAt: current basename) entryHash ~= tree hash
							 ifTrue: [parentTree putEntry: (GitTreeEntry
								directoryNamed: current basename
								hash: tree hash
								in: repository).
								pendingPathsForEntryUpdate add: current parent]]
					ifTrue: [(parentTree entryAt: current basename
							ifPresent: [:entry |
								parentTree removeEntryAt: current basename.
								pendingPathsForEntryUpdate add: current parent]
							ifAbsent: [])].
				last := current]].