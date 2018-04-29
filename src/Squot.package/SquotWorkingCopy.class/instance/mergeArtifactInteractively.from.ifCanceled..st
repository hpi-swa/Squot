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
				ifPresent: [:baseArtifact | SquotSnapshot with: {baseArtifact}]
				ifAbsent: [SquotSnapshot empty]).
		myArtifactSnapshot := self artifactAt: anArtifact path
			ifPresent: [:loadedArtifact | SquotSnapshot with: {loadedArtifact}]
			ifAbsent: [SquotSnapshot empty].
		patch := SquotMergePatchBuilder new
			patchFrom: myArtifactSnapshot
			to: (SquotSnapshot with: {anArtifact})
			base: base.
		self loadPatchInteractively: patch ifCanceled: [^ cancelBlock value]].