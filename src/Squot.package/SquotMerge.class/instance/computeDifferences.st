private
computeDifferences
	| fromBaseToExisting fromBaseToIncoming commonPaths |
	fromBaseToIncoming := incoming patchRelativeToBase: base.
	fromBaseToExisting := working patchRelativeToBase: base.
	commonPaths := fromBaseToIncoming commonPathsWith: fromBaseToExisting.
	commonPaths do: [:eachPath | | existingDiff incomingDiff artifactMerge |
		existingDiff := fromBaseToExisting diffAt: eachPath.
		incomingDiff := fromBaseToIncoming diffAt: eachPath.
		artifactMerge := existingDiff mergeWith: incomingDiff.
		artifactMerge isConflict
			ifTrue: [containerConflicts at: artifactMerge path put: artifactMerge]
			ifFalse: [artifactMerge mayAffectArtifact ifTrue: [self addMerge: artifactMerge]]].
	(fromBaseToIncoming paths copyWithoutAll: commonPaths)
		do: [:eachPath | | diff |
			diff := fromBaseToIncoming diffAt: eachPath.
			diff addToMerge: self modifying: (working artifactAt: eachPath ifAbsent: [])].
	loadOrderMerge := SquotLoadOrderMerge
		into: working loadOrder merge: incoming loadOrder basedOn: base loadOrder.