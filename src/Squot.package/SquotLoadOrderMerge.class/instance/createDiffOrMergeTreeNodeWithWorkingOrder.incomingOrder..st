*Squot-Tools
createDiffOrMergeTreeNodeWithWorkingOrder: workingLoadOrderBlock incomingOrder: incomingLoadOrderBlock
	^ self hasConflicts
		ifTrue: [SquotMergeDiffNode
				title: 'Conflicting load orders'
				content: self
				children: #()
				onInclude: [self chooseIncoming]
				onExclude: [self chooseWorking]
				onReset: [self resetChoice]]
		ifFalse: [SquotDiffNode
				title: 'Changed load order'
				content: self
				children: #()
				onInclude: [self newLoadOrder: incomingLoadOrderBlock value]
				onExclude: [self newLoadOrder: workingLoadOrderBlock value]].