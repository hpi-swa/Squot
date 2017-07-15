loading and unloading
mergeVersionInteractively: aVersion ifCanceled: cancelBlock
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	| mergeBases fastForwardPossible mergePatch |
	fastForwardPossible := false.
	mergeBases := self checkMergeBasesWith: aVersion
		ifNoCommonAncestor: ["the versions have no common base version, fall back to load"
			self loadVersionInteractively: aVersion ifCanceled: [^ cancelBlock value].
			^ self addParentVersion: aVersion]
		ifAncestor: [^ self inform: 'Merge version already is an ancestor of the head of the active branch ', loadedHistorian name, '.']
		ifDescendant: [fastForwardPossible := true].
	self flag: 'TODO: if there are multiple merge-bases, resolve conflicts recursively below'.
	mergePatch := self patchForMergeWith: aVersion basedOn: mergeBases anyOne.
	self loadPatchInteractively: mergePatch ifCanceled: [^ cancelBlock value].
	fastForwardPossible
		ifTrue: 
			[loadedHistorian version: aVersion.
			self loadedVersion: aVersion]
		ifFalse: [self addParentVersion: aVersion].