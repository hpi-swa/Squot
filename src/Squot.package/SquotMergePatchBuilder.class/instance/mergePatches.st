private
mergePatches
	| commonPaths |
	commonPaths := fromBaseToIncoming commonPathsWith: fromBaseToExisting.
	commonPaths do: [:eachPath | | existingDiff incomingDiff mergingDiff |
		existingDiff := fromBaseToExisting diffAt: eachPath.
		incomingDiff := fromBaseToIncoming diffAt: eachPath.
		mergingDiff := existingDiff mergeWith: incomingDiff.
		mergingDiff hasChanges ifTrue: [diffs at: eachPath put: mergingDiff]].
	(fromBaseToIncoming paths difference: commonPaths)
		do: [:eachPath | diffs at: eachPath put: (fromBaseToIncoming diffAt: eachPath)].