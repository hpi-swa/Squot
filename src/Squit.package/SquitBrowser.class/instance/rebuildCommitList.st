caching
rebuildCommitList
	| list count walker |
	self hasBranchSelection ifFalse: [^ cachedCommitList := #()].
	list := OrderedCollection new.
	count := 0.
	(walker := SquotHistoryWalker new)
		startingFrom: self branchSelection historian version
		do: [:each |
			count := count + 1.
			list add: each.
			count > 30 ifTrue:
				[cachedCommitList := list.
				walker stop.
				self continueBuildingCommitList: list asyncWith: walker.
				^ self]].
	cachedCommitList := list.