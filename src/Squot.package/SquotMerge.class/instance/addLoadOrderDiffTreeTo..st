*Squot-Tools
addLoadOrderDiffTreeTo: aCollection 
	self flag: #featureEnvy. "Move to SquotLoadOrderMerge"
	loadOrderMerge hasConflicts ifFalse: [^ self].
	aCollection add: (loadOrderMerge hasConflicts
		ifTrue:
			[SquotMergeDiffNode
				title: 'Conflicting load orders'
				content: loadOrderMerge
				children: #()
				onInclude: [loadOrderMerge chooseIncoming]
				onExclude: [loadOrderMerge chooseWorking]
				onReset: [loadOrderMerge resetChoice]]
		ifFalse:
			[SquotDiffNode
				title: 'Changed load order'
				content: loadOrderMerge
				children: #()
				onInclude: [loadOrderMerge chooseIncoming]
				onExclude: [loadOrderMerge chooseWorking]]).
