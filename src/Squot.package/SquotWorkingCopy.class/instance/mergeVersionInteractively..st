loading and unloading
mergeVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	| mergeBase aVersionIsAncestor fastForwardPossible mergeSnapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	self withCurrentSnapshot:
	[mergeBase := aVersion mergeBaseWith: self baseVersion.
	mergeBase ifNil:
		["the versions have no common base version, fall back to load"
		(self loadSnapshotInteractively: aVersion snapshot) ifTrue:
			[self addParentVersion: aVersion].
		^ self].
	aVersionIsAncestor := mergeBase = aVersion.
	aVersionIsAncestor ifTrue: [^ self inform: 'Merge version already is an ancestor of the head of the active branch ', loadedHistorian name, '.'].
	fastForwardPossible := mergeBase = self baseVersion.
	mergeSnapshot :=
		self currentSnapshot
			mergeWith: aVersion snapshot
			basedOn: mergeBase snapshot.
	(self loadSnapshotInteractively: mergeSnapshot) ifTrue:
		[fastForwardPossible
			ifTrue: 
				[loadedHistorian version: aVersion.
				self loadedVersion: aVersion]
			ifFalse: [self addParentVersion: aVersion]]].