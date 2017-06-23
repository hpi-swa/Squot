ui
commitList
	^ self projectSelection
		ifNil: [#()]
		ifNotNil:
			[self searchTerm ifEmpty: [^ cachedCommitList].
			^ cachedCommitList select: [:each |
				each message, each metadata asString, each internalId
					includesSubstring: self searchTerm]]