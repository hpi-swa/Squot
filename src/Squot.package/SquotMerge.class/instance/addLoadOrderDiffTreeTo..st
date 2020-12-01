*Squot-Tools
addLoadOrderDiffTreeTo: aCollection
	loadOrderMerge hasChanges ifFalse: [^ self].
	aCollection
		add: (loadOrderMerge
				createDiffOrMergeTreeNodeWithWorkingOrder: [working loadOrder]
				incomingOrder: [customizedLoadOrder ifNil: [incoming loadOrder]]).