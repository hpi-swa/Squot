private
computeDifferences
	| fromBaseToExisting fromBaseToIncoming commonPaths orderMerge |
	fromBaseToIncoming := incomingContainer patchRelativeToBase: baseContainer.
	fromBaseToExisting := workingCopy patchRelativeToBase: baseContainer.
	commonPaths := fromBaseToIncoming commonPathsWith: fromBaseToExisting.
	commonPaths do: [:eachPath | | existingDiff incomingDiff mergingDiff |
		existingDiff := fromBaseToExisting diffAt: eachPath.
		incomingDiff := fromBaseToIncoming diffAt: eachPath.
		mergingDiff := existingDiff mergeWith: incomingDiff.
		mergingDiff isConflict
			ifTrue: [containerConflicts at: mergingDiff path put: mergingDiff]
			ifFalse: [mergingDiff hasChanges ifTrue: [patchBuilder addDiff: mergingDiff]]].
	(fromBaseToIncoming paths copyWithoutAll: commonPaths)
		do: [:eachPath | patchBuilder addDiff: (fromBaseToIncoming diffAt: eachPath)].
	orderMerge := SquotLoadOrderMerge new
		workingLoadOrder: workingCopy loadOrder;
		incomingLoadOrder: incomingContainer loadOrder;
		baseLoadOrder: baseContainer loadOrder;
		mergeLoadOrders;
		yourself.
	loadOrderConflicts := orderMerge conflicts.