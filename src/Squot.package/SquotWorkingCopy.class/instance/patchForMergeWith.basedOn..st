comparing
patchForMergeWith: mergeVersion basedOn: baseVersion
	"Answer a merging patch (which can include conflicts) that incorporates changes from
	baseVersion to mergeVersion into my objects."
	| diffs mine theirs bases commonArtifacts fromBaseToMe fromBaseToMergeVersion |
	mine := store artifacts.
	theirs := mergeVersion lazyArtifacts.
	bases := baseVersion lazyArtifacts.
	'Diffing for merge' displaySequentialProgress:
	[fromBaseToMergeVersion := mergeVersion patchRelativeToBase: baseVersion.
	ProgressNotification signal: 1/4.
	fromBaseToMe := self patchRelativeToBase: baseVersion.
	ProgressNotification signal: 1/2.
	commonArtifacts := fromBaseToMergeVersion commonPathsWith: fromBaseToMe.
	diffs := Dictionary new.
	commonArtifacts do: [:eachPath | | eachDiff |
		eachDiff := (mine at: eachPath) mergeDiffWith: (theirs at: eachPath) basedOn: (bases at: eachPath).
		diffs at: eachPath put: eachDiff].
	ProgressNotification signal: 3/4.
	(fromBaseToMergeVersion paths difference: commonArtifacts)
		do: 	[:eachPath | diffs at: eachPath put: (fromBaseToMergeVersion at: eachPath)]].
	^ SquotPatch with: diffs