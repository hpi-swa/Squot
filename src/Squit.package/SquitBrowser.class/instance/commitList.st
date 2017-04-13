ui
commitList
	^ self projectSelection
		ifNil: [#()]
		ifNotNil: [:project | | historian |
			self branchSelection ifNil: [^ #()].
			historian := self branchSelection historian.
			((SquotHistoryWalker new startingFrom: historian version)
				collect: [:each | SquitVersionWrapper on: each])
					select: [:each | self searchTerm
						ifEmpty: [true]
						ifNotEmpty: [:term | each asString includesSubstring: term]]]