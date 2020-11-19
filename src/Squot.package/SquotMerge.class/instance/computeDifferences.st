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
	self flag: #todo. "Workaround: the code commented-out below is more generic than the following workaround, but it is currently discouraged by bugs in object patching (which also happens when the patch is computed, see updateRightArtifacts)."
	((working artifacts select: [:each | (each respondsTo: #isLoaded) and: [each isLoaded not]]) reject: [:each | (commonPaths includes: each path) or: [fromBaseToIncoming includesDiffAt: each path]])
		do: [:each | | diff |
			diff := each diffAgainst: (incoming artifactAt: each path).
			diff mayAffectArtifact ifTrue: [diff addToMerge: self modifying: each]].
	"directPatch := incoming patchRelativeToBase: working.
	(directPatch paths copyWithoutAll: commonPaths, fromBaseToIncoming paths)
		do: [:eachPath | | diff |
			Artifacts that are different in incoming, although they weren't changed there.
			diff := directPatch diffAt: eachPath.
			diff addToMerge: self modifying: (working artifactAt: eachPath ifAbsent: [])]."
	loadOrderMerge := SquotLoadOrderMerge
		into: working loadOrder merge: incoming loadOrder basedOn: base loadOrder.