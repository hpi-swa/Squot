loading and unloading
mergeVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	| mergeBase aVersionIsAncestor fastForwardPossible mergeSnapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	mergeBase := aVersion mergeBaseWith: self baseVersion.
	aVersionIsAncestor := mergeBase = aVersion.
	aVersionIsAncestor ifTrue: [^ self inform: 'This version already is an ancestor of the head of the active branch ', loadedHistorian name, '.'].
	fastForwardPossible := mergeBase = self baseVersion.
	mergeSnapshot :=
		store captureSnapshot
			mergeWith: aVersion snapshot
			basedOn: mergeBase snapshot.
	(self loadSnapshotInteractively: mergeSnapshot) ifTrue:
		[fastForwardPossible
			ifTrue: [loadedHistorian version: aVersion]
			ifFalse: [self addParentVersion: aVersion]].