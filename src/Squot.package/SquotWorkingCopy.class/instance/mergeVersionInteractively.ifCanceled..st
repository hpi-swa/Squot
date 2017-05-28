loading and unloading
mergeVersionInteractively: aVersion ifCanceled: cancelBlock
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	| mergeBase aVersionIsAncestor fastForwardPossible mergePatch |
	mergeBase := aVersion mergeBaseWith: self baseVersion.
	mergeBase ifNil:
		["the versions have no common base version, fall back to load"
		self loadVersionInteractively: aVersion snapshot ifCanceled: [^ cancelBlock value].
		^ self addParentVersion: aVersion].
	aVersionIsAncestor := mergeBase = aVersion.
	aVersionIsAncestor ifTrue: [^ self inform: 'Merge version already is an ancestor of the head of the active branch ', loadedHistorian name, '.'].
	fastForwardPossible := mergeBase = self baseVersion.
	mergePatch := self patchForMergeWith: aVersion basedOn: mergeBase.
	self loadPatchInteractively: mergePatch ifCanceled: [^ cancelBlock value].
	fastForwardPossible
		ifTrue: 
			[loadedHistorian version: aVersion.
			self loadedVersion: aVersion]
		ifFalse: [self addParentVersion: aVersion].