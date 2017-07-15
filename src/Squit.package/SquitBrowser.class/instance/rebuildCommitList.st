caching
rebuildCommitList
	| list count walker |
	commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
	self hasBranchSelection ifFalse: [^ cachedCommitList := #()].
	list := OrderedCollection new.
	count := 0.
	(walker := SquotHistoryWalker new)
		startingFrom: selectedHistorian version
		do: [:each |
			count := count + 1.
			list add: each.
			count > 30 ifTrue:
				[cachedCommitList := list.
				walker stop.
				self continueBuildingCommitList: list asyncWith: walker.
				^ self]].
	cachedCommitList := list.