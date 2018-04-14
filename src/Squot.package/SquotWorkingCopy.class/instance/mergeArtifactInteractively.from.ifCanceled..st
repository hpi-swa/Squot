loading and unloading
mergeArtifactInteractively: anArtifact from: aVersion ifCanceled: cancelBlock
	"Merge a single artifact with the currently loaded one."
	| mergeBases mergeBase myArtifacts base patchToMe patchToAnArtifact patch |
	self temporarilySaveChangesDuring:
		[mergeBases := self checkMergeBasesWith: aVersion
			ifNoCommonAncestor: [{SquotSnapshot empty}]
			ifAncestor: [^ self inform: 'The version already is an ancestor of the active branch tip.']
			ifDescendant: [].
		self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively below'.
		mergeBase := mergeBases anyOne.
		base := (mergeBase artifactAt: anArtifact path
				ifPresent: [:baseArtifact | SquotSnapshot with: {baseArtifact}]
				ifAbsent: [SquotSnapshot empty]).
		myArtifacts := self artifactAt: anArtifact path
			ifPresent: [:loadedArtifact | Dictionary newFrom:
						{loadedArtifact path -> loadedArtifact}]
			ifAbsent: [Dictionary new].
		patchToMe := (SquotSnapshot with: myArtifacts) patchRelativeToBase: base.
		patchToAnArtifact := (SquotSnapshot with: {anArtifact}) patchRelativeToBase: base.
		patch := SquotPatch with:
			(self mergeDiffsFromBaseToMe: patchToMe
				fromBaseToOther: patchToAnArtifact
				withBaseArtifacts: base artifacts
				myArtifacts: myArtifacts
				theirArtifacts: (Dictionary newFrom: {anArtifact path -> anArtifact})).
		self loadPatchInteractively: patch ifCanceled: [^ cancelBlock value]].