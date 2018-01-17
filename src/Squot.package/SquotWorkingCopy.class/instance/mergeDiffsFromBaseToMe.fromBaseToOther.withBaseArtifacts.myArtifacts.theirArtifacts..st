comparing
mergeDiffsFromBaseToMe: patchToMe fromBaseToOther: patchToMergeVersion withBaseArtifacts: bases myArtifacts: mine theirArtifacts: theirs
	| commonArtifacts diffs |
	commonArtifacts := patchToMergeVersion commonPathsWith: patchToMe.
	diffs := Dictionary new.
	commonArtifacts do: [:eachPath | | myDiff theirDiff mergeDiff leftRightDiff |
		myDiff := patchToMe diffAt: eachPath.
		theirDiff := patchToMergeVersion diffAt: eachPath.
		(myDiff couldBeMergedWith: theirDiff)
			ifTrue: [bases at: eachPath
				ifPresent: [:base |
					mergeDiff := (mine at: eachPath) mergeDiffWith: (theirs at: eachPath) basedOn: base.
					diffs at: eachPath put: mergeDiff]
				ifAbsent: [leftRightDiff := (mine at: eachPath) diffAgainst: (theirs at: eachPath).
					diffs at: eachPath put: leftRightDiff asConflicts]]
			ifFalse: [diffs at: eachPath put: (myDiff inConflictWith: theirDiff "(e.g., removal vs. change)")]].
	ProgressNotification signal: 3/4.
	(patchToMergeVersion paths difference: commonArtifacts)
		do: 	[:eachPath | diffs at: eachPath put: (patchToMergeVersion diffAt: eachPath)].
	^ diffs