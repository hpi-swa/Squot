private
mergePatches
	| commonPaths |
	commonPaths := fromBaseToIncoming commonPathsWith: fromBaseToExisting.
	commonPaths do: [:eachPath | | existingDiff incomingDiff mergingDiff |
		existingDiff := fromBaseToExisting diffAt: eachPath.
		incomingDiff := fromBaseToIncoming diffAt: eachPath.
		(existingDiff couldBeMergedWith: incomingDiff)
			ifTrue: [baseArtifacts at: eachPath
					ifPresent: [:base | mergingDiff := existingDiff mergeWith: incomingDiff]
					ifAbsent: [mergingDiff := ((leftArtifacts at: eachPath)
								diffAgainst: (rightArtifacts at: eachPath)) asConflicts]]
			ifFalse: [mergingDiff := existingDiff inConflictWith: incomingDiff
					"e.g., removal vs. change"].			
		diffs at: eachPath put: mergingDiff].
	(fromBaseToIncoming paths difference: commonPaths)
		do: [:eachPath | diffs at: eachPath put: (fromBaseToIncoming diffAt: eachPath)].