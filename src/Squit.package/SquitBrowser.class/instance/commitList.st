ui
commitList
	^ self projectSelection
		ifNil: [#()]
		ifNotNil: [:project | | historian |
			self branchSelection ifNil: [^ #()].
			historian := self branchSelection historian.
			(SquotHistoryWalker new startingFrom: historian version)
					select: [:each | self searchTerm
						ifEmpty: [true]
						ifNotEmpty: [:term | each message, each metadata asString, each internalId includesSubstring: term]]]