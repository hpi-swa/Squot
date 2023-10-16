menu
refListMenu: aMenu
	self activeRef ifNotNil: [ | isBranch refTypeName |
		self commitMenu: aMenu.
		aMenu target: self.
		isBranch := self activeWorkingCopy isSqueakBranchRef: self activeRef.
		refTypeName := isBranch ifTrue: ['branch'] ifFalse: ['ref'].
		isBranch ifTrue: [aMenu add: 'switch to this branch' action: #actionSwitchToActiveBranch].
		aMenu
			add: ('merge this {1}' format: {refTypeName}) action: #actionMergeActiveRef;
			add: ('delete this {1}' format: {refTypeName}) action: #actionDeleteActiveRef].
	aMenu target: self.
	aMenu add: (self showGitRefs ifTrue: ['<yes>'] ifFalse: ['<no>']), 'show git refs' action: #toggleShowGitRefs.
	^ aMenu