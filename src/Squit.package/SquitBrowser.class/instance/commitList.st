ui
commitList
	^ self projectSelection
		ifNil: [#()]
		ifNotNil:
			[self searchTerm ifEmpty: [^ cachedCommitList].
			^ cachedCommitList select: [:each |
				(each message, each metadata asString, each internalId
					includesSubstring: self searchTerm)
					or: [(self historiansDecorationAtVersion: each)
							ifNil: [false]
							ifNotNil: [:historians | (historians joinSeparatedBy: ' ')
														includesSubstring: self searchTerm]]]]