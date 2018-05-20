loading and unloading
mergeVersionWithLoadedObjects: aVersion ifCanceled: cancelBlock
	"Merge objects with those from aVersion, but do not record the merge in history."
	| mergeBases mergePatch |
	mergeBases := self checkMergeBasesOfLoadedVersionWith: aVersion
		ifNoCommonAncestor: ["the versions have no common base version"
			{SquotSnapshot empty}]
		ifAncestor:
			[self inform: 'Your objects are descendants of this version already.'.
			^ cancelBlock value]
		ifDescendant: ["fast forward"].
	self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively below'.
	mergePatch := SquotMergePatchBuilder new
		patchFrom: self currentSnapshot
		to: aVersion
		base: mergeBases anyOne.
	self loadPatchInteractively: mergePatch ifCanceled: [^ cancelBlock value].