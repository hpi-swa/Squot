comparing
mergeDiffsFromBaseToMe: patchToMe fromBaseToOther: patchToMergeVersion withBaseArtifacts: bases myArtifacts: mine theirArtifacts: theirs
	| commonArtifacts diffs |
	commonArtifacts := patchToMergeVersion commonPathsWith: patchToMe.
	diffs := Dictionary new.
	commonArtifacts do: [:eachPath | | eachDiff |
		eachDiff := (mine at: eachPath) mergeDiffWith: (theirs at: eachPath) basedOn: (bases at: eachPath).
		diffs at: eachPath put: eachDiff].
	ProgressNotification signal: 3/4.
	(patchToMergeVersion paths difference: commonArtifacts)
		do: 	[:eachPath | diffs at: eachPath put: (patchToMergeVersion diffAt: eachPath)].
	^ diffs