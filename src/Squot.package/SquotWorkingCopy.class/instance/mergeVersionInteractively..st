loading and unloading
mergeVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	| mergeBases fastForwardPossible mergeSnapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	fastForwardPossible := false.
	self withCurrentSnapshot:
	[mergeBases := self checkMergeBasesWith: aVersion
		ifNoCommonAncestor:
			["the versions have no common base version, fall back to load"
			(self loadSnapshotInteractively: aVersion snapshot) ifTrue:
				[self addParentVersion: aVersion].
			^ self]
		ifAncestor: [^ self inform: 'Merge version already is an ancestor of the head of the active branch ', loadedHistorian name, '.']
		ifDescendant: [fastForwardPossible := true].
	mergeSnapshot :=
		self currentSnapshot
			mergeWith: aVersion snapshot
			basedOn: mergeBases anyOne snapshot.
	(self loadSnapshotInteractively: mergeSnapshot) ifTrue:
		[fastForwardPossible
			ifTrue: 
				[loadedHistorian version: aVersion.
				self loadedVersion: aVersion]
			ifFalse: [self addParentVersion: aVersion]]].