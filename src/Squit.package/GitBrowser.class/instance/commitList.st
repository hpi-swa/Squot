as yet unclassified
commitList
	^ self projectSelection
		ifNil: [#()]
		ifNotNil: [:project | | historian |
			self branchSelection ifNil: [^ #()].
			historian := self branchSelection historian.
			(SquotHistoryWalker new startingFrom: historian version)
				collect: [:each | SquitVersionWrapper on: each]]