private
computeDifferences
	| fromBaseToExisting fromBaseToIncoming commonPaths |
	SquotToggles useNewApi ifTrue: [self deprecated: 'Use SquotProjectMergeFactory instead'].
	fromBaseToIncoming := incoming patchRelativeToBase: base.
	fromBaseToExisting := working patchRelativeToBase: base.
	commonPaths := fromBaseToIncoming commonPathsWith: fromBaseToExisting.
	commonPaths do: [:eachPath | | existingDiff incomingDiff artifactMerge |
		existingDiff := fromBaseToExisting diffAt: eachPath.
		incomingDiff := fromBaseToIncoming diffAt: eachPath.
		artifactMerge := existingDiff mergeWith: incomingDiff.
		artifactMerge isConflict
			ifTrue: [containerConflicts at: artifactMerge path put: artifactMerge]
			ifFalse:
				[artifactMerge mayAffectArtifact
					ifTrue:
						[artifactMerge isMerge "one side could have yielded to the other"
							ifTrue: [	self addMerge: artifactMerge]
							ifFalse: [self addModification: artifactMerge]]]].
	(fromBaseToIncoming paths copyWithoutAll: commonPaths)
		do: [:eachPath | | diff |
			diff := fromBaseToIncoming diffAt: eachPath.
			diff addToMerge: self modifying: (working artifactAt: eachPath ifAbsent: [])].

	"Allow to load unloaded artifacts even if they are not affected otherwise by the merge."
	((working artifacts select: [:each | (each respondsTo: #isLoaded) and: [each isLoaded not]]) reject: [:each | (commonPaths includes: each path) or: [fromBaseToIncoming includesDiffAt: each path]])
		do: [:each | | diff |
			diff := each diffAgainst: each artifact.
			diff mayAffectArtifact ifTrue: [diff addToMerge: self modifying: each]].

	loadOrderMerge := SquotLoadOrderMerge
		into: working loadOrder merge: incoming loadOrder basedOn: base loadOrder.