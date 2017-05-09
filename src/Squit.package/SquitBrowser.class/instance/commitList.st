ui
commitList
	^ self projectSelection
		ifNil: [#()]
		ifNotNil: [:project | 
			self branchSelection ifNil: [^ #()].
			self branchSelection historian version = (cachedCommitList at: 1 ifAbsent: [])
				ifFalse: [self rebuildCommitList].
			self searchTerm ifEmpty: [^ cachedCommitList].
			^ cachedCommitList select: [:each |
				each message, each metadata asString, each internalId
					includesSubstring: self searchTerm]]