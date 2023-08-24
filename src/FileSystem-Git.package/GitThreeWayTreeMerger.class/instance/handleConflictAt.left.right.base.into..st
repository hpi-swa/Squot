as yet unclassified
handleConflictAt: aPath left: leftEntry right: rightEntry base: baseEntry into: parentResultTree
	(leftEntry notNil
		and: [rightEntry notNil]
		and: [leftEntry object isTree]
		and: [rightEntry object isTree])
		ifTrue: [| baseTree resultTree |
			baseTree := (baseEntry notNil and: [baseEntry object isTree])
				ifTrue: [baseEntry object]
				ifFalse: [GitTree new].
			resultTree := GitTree new.
			self
				merge: leftEntry object
				with: rightEntry object
				base: baseTree
				into: resultTree
				at: aPath.
			parentResultTree putEntry:
				(GitOwningTreeEntry
					directory: resultTree
					named: leftEntry entryName
					in: leftEntry repository)]
		ifFalse: [self conflicts
					at: aPath
					put: (GitMergeConflict left: leftEntry right: rightEntry base: baseEntry)].