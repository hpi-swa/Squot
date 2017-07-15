loading and unloading
mergeArtifactInteractively: anArtifact from: aVersion ifCanceled: cancelBlock
	"Merge a single artifact with the currently loaded one."
	| mergeBases mergeBase myArtifact base patchToMe patchToAnArtifact patch |
	self temporarilySaveChangesDuring:
		[mergeBases := self checkMergeBasesWith: aVersion
			ifNoCommonAncestor: [^ self loadArtifactInteractively: anArtifact ifCanceled: []]
			ifAncestor: [^ self inform: 'The version already is an ancestor of the active branch tip.']
			ifDescendant: [].
		self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively below'.
		mergeBase := mergeBases anyOne.
		base := SquotSnapshot with:
			{mergeBase artifactAt: anArtifact path ifAbsent: [anArtifact absentCopy]}.
		myArtifact := self artifactAt: anArtifact path ifAbsent: [anArtifact absentCopy].
		patchToMe := (SquotSnapshot with: {myArtifact}) patchRelativeToBase: base.
		patchToAnArtifact := (SquotSnapshot with: {anArtifact}) patchRelativeToBase: base.
		patch := SquotPatch with:
			(self mergeDiffsFromBaseToMe: patchToMe
				fromBaseToOther: patchToAnArtifact
				withBaseArtifacts: base artifacts myArtifacts: {myArtifact} theirArtifacts: {anArtifact}).
		self loadPatchInteractively: patch ifCanceled: [^ cancelBlock value]].