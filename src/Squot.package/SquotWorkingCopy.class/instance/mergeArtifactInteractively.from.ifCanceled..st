loading and unloading
mergeArtifactInteractively: anArtifact from: aVersion ifCanceled: cancelBlock
	"Merge a single artifact with the currently loaded one."
	| mergeBases mergeBase base merge |
	self temporarilySaveChangesDuring:
		[mergeBases := self checkMergeBasesOfLoadedVersionWith: aVersion
			ifNoCommonAncestor: [{SquotSnapshot empty}]
			ifAncestor: [^ self inform: 'The version already is an ancestor of the active branch tip.']
			ifDescendant: [].
		self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively below'.
		mergeBase := mergeBases anyOne.
		self addGlobalObjectsToStore: (SquotSnapshot builder add: anArtifact; buildSnapshot).
		base := (mergeBase artifactAt: anArtifact path
				ifPresent: [:baseArtifact | self newSnapshotBuilder add: baseArtifact; buildSnapshot]
				ifAbsent: [self lazySnapshot]).
		merge := SquotMerge
			into: self
			merge: (self newSnapshotBuilder add: anArtifact; buildSnapshot)
			basedOn: base.
		self mergeInteractively: merge ifCanceled: [^ cancelBlock value]].