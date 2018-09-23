loading and unloading
mergeArtifactInteractively: anArtifact from: aVersion ifCanceled: cancelBlock
	"Merge a single artifact with the currently loaded one."
	| mergeBases mergeBase myArtifactSnapshot base patch |
	self temporarilySaveChangesDuring:
		[mergeBases := self checkMergeBasesOfLoadedVersionWith: aVersion
			ifNoCommonAncestor: [{SquotSnapshot empty}]
			ifAncestor: [^ self inform: 'The version already is an ancestor of the active branch tip.']
			ifDescendant: [].
		self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively below'.
		mergeBase := mergeBases anyOne.
		base := (mergeBase artifactAt: anArtifact path
				ifPresent: [:baseArtifact | self newSnapshotBuilder add: baseArtifact; buildSnapshot]
				ifAbsent: [self lazySnapshot]).
		myArtifactSnapshot := self lazySnapshot.
		patch := SquotMergePatchBuilder new
			patchFrom: myArtifactSnapshot
			to: (self newSnapshotBuilder add: anArtifact; buildSnapshot)
			base: base.
		self loadPatchInteractively: patch ifCanceled: [^ cancelBlock value]].