ui
refList
	| refs |
	refs := self activeWorkingCopy ifNotNil: #allReferences ifNil: [^ {}].
	self showGitRefs ifFalse: [
		refs := refs select: [:each | self activeWorkingCopy isSqueakRef: each]].
	^ refs sorted: [:a :b | self doesRef: a comeBeforeRef: b]