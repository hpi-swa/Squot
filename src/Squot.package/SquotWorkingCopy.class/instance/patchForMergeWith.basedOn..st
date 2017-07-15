comparing
patchForMergeWith: mergeVersion basedOn: baseVersion
	"Answer a merging patch (which can include conflicts) that incorporates changes from
	baseVersion to mergeVersion into my objects."
	| diffs mine theirs bases fromBaseToMe fromBaseToMergeVersion |
	mine := store artifacts.
	theirs := mergeVersion lazyArtifacts.
	bases := baseVersion lazyArtifacts.
	'Diffing for merge' displaySequentialProgress:
	[fromBaseToMergeVersion := mergeVersion patchRelativeToBase: baseVersion.
	ProgressNotification signal: 1/4.
	fromBaseToMe := self patchRelativeToBase: baseVersion.
	ProgressNotification signal: 1/2.
	diffs := self
		mergeDiffsFromBaseToMe: fromBaseToMe
		fromBaseToOther: fromBaseToMergeVersion
		withBaseArtifacts: bases myArtifacts: mine theirArtifacts: theirs].
	^ SquotPatch with: diffs